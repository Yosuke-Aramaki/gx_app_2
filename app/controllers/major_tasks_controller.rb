class MajorTasksController < ApplicationController
  def index
    @major_task = MajorTask.new
    @user = current_user
  end

  def new
    @major_task = MajorTask.new
  end

  def create 
    # render plain: params.inspect
    @major_task = MajorTask.new(major_task_params)
    @major_task.user_id = current_user.id
    if @major_task.save
      redirect_to root_path
    end
  end

  private
  def major_task_params
    params.require(:major_task).permit(:text, :start_date, :end_date, :time_duration)
  end

end
