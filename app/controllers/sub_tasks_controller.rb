class SubTasksController < ApplicationController

  def new
    @sub_task = SubTask.new
  end

  def create 
    # render plain: params.inspect
    @sub_task = SubTask.new(sub_task_params)
    @sub_task.major_task_id = params[:major_task_id]
    if @sub_task.save
      redirect_to root_path()
    end
  end

  private
  def sub_task_params
    params.require(:sub_task).permit(:text, :start_date, :end_date, :time_duration)
  end

end

