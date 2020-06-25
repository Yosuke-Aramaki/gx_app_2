class SubTasksController < ApplicationController

  def new
    @sub_task = SubTask.new
  end

  def create 
    # render plain: params.inspect
    @sub_task = SubTask.new(sub_task_params)
    @sub_task.major_task_id = params[:major_task_id]
    @sub_task.user_id = current_user.id
    @major_task = MajorTask.find(params[:major_task_id])
    if @sub_task.start_date.nil?
      @sub_task.start_date = Date.today
      if @major_task.start_date.nil?
        @major_task.start_date = @sub_task.start_date
        @major_task.save      
      end
    elsif @major_task.start_date.nil? || @major_task.end_date.nil? || (@major_task.start_date > @sub_task.start_date && @major_task.end_date < @sub_task.end_date)
      @major_task.start_date = @sub_task.start_date
      @major_task.end_date = @sub_task.end_date
      @major_task.save    
    elsif @major_task.start_date > @sub_task.start_date
      @major_task.start_date = @sub_task.start_date
      @major_task.save
    elsif @major_task.end_date < @sub_task.end_date
      @major_task.end_date = @sub_task.end_date
      @major_task.save
    else
    end
    if @sub_task.save
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    end
  end

  private
  def sub_task_params
    params.require(:sub_task).permit(:text, :start_date, :end_date, :time_duration)
  end

end

