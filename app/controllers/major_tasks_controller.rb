class MajorTasksController < ApplicationController
  def index
    @major_task = MajorTask.new
    @user = current_user
    require 'date'
    today = Date.today
    @major_task_list_today = MajorTask.where("start_date <= ?", today).where("end_date >= ?", today)
    @major_task_list_1day_later = MajorTask.where("start_date <= ?", today + 1).where("end_date >= ?", today + 1)
    @major_task_list_2day_later = MajorTask.where("start_date <= ?", today + 2).where("end_date >= ?", today + 2)
    @major_task_list_3day_later = MajorTask.where("start_date <= ?", today + 3).where("end_date >= ?", today + 3)
    @major_task_list_4day_later = MajorTask.where("start_date <= ?", today + 4).where("end_date >= ?", today + 4)
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
