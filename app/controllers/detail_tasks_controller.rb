class DetailTasksController < ApplicationController
  
  def new
    @detail_task = DetailTask.new
  end

  def create 
    @detail_task = DetailTask.new(detail_task_params)
    @detail_task.sub_task_id = params[:sub_task_id]
    @detail_task.date = Date.today
    @sub_task = SubTask.find(params[:sub_task_id])
    if @sub_task.time_duration.nil? 
      @sub_task.update(time_duration: params[:detail_task][:time_duration])
    else
      sum = @sub_task.time_duration + params[:detail_task][:time_duration].to_f
      @sub_task.update(time_duration: sum)
    end
    if @detail_task.save
      redirect_to root_path()
    end
  end

  def show
    @detail_task = DetailTask.find(params[:id])
  end

  def update
    # render plain: params.inspect
    @sub_task = SubTask.find(params[:sub_task_id])
    @detail_task = DetailTask.find(params[:id])
    @detail_task.time_duration = params[:detail_task][:time_duration]
    if @sub_task.time_duration.nil? 
      @sub_task.update(time_duration: params[:detail_task][:time_duration])
    else
      sum = @sub_task.time_duration + params[:detail_task][:time_duration].to_f
      @sub_task.update(time_duration: sum)
    end
    if @detail_task.update(time_duration: params[:detail_task][:time_duration])
      redirect_to root_path()
    end
  end

  private
  def detail_task_params
    params.require(:detail_task).permit(:text, :date, :time_duration)
  end

end
