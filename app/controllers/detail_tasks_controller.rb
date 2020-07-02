class DetailTasksController < ApplicationController
  
  def new
    @detail_task = DetailTask.new
  end

  def create 
    @detail_task = DetailTask.new(detail_task_params)
    @detail_task.sub_task_id = params[:sub_task_id]
    @detail_task.user_id = current_user.id
    @sub_task = SubTask.find(params[:sub_task_id])
    @major_task = MajorTask.find(@sub_task.major_task_id)
    if @sub_task.time_duration.nil? 
      @sub_task.update(time_duration: params[:detail_task][:time_duration])
      if @major_task.time_duration.nil?
        @major_task.update(time_duration: params[:detail_task][:time_duration])
      end
    else
      sumofSubTask = @sub_task.time_duration + params[:detail_task][:time_duration].to_f
      @sub_task.update(time_duration: sumofSubTask)
      sumofMajorTask = @major_task.time_duration + params[:detail_task][:time_duration].to_f
      @major_task.update(time_duration: sumofMajorTask)
    end
    if @detail_task.save
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    # render plain: params.inspect
    @sub_task = SubTask.find(params[:sub_task_id])
    @detail_task = DetailTask.find(params[:id])
    @major_task = MajorTask.find(@sub_task.major_task_id)
    if @sub_task.time_duration.nil? 
      @sub_task.update(time_duration: params[:detail_task][:time_duration])
      if @major_task.time_duration.nil?
        @major_task.update(time_duration: params[:detail_task][:time_duration])
      end
    else
      sumofSubTask = @sub_task.time_duration + params[:detail_task][:time_duration].to_f
      @sub_task.update(time_duration: sumofSubTask)
      sumofMajorTask = @major_task.time_duration + params[:detail_task][:time_duration].to_f
      @sub_task.update(time_duration: sumofMajorTask)
    end
    if @detail_task.update(detail_task_params)
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @detail_task = DetailTask.find(params[:id])
    @detail_task.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_path }
    end
  end

  def detail_task_modal
    @detail_task = DetailTask.find(params[:id])
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private
  def detail_task_params
    params.require(:detail_task).permit(:text, :date, :time_duration)
  end

end
