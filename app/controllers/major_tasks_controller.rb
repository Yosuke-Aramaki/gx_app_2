class MajorTasksController < ApplicationController

  def index
    if logged_in?
      @major_task = MajorTask.new
      @user = current_user
      require 'date'
      @sub_task_list_today = @user.sub_tasks.where("start_date >= ?", Date.today ).order(:major_task_id)
      @sub_task_list_today
    end
  end

  def new
    @major_task = MajorTask.new
  end

  def create 
    # render plain: params.inspect
    @major_task = MajorTask.new(major_task_params)
    @major_task.user_id = current_user.id
    if @major_task.save
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    end
  end

  private
  def major_task_params
    params.require(:major_task).permit(:text, :start_date, :end_date, :time_duration)
  end

  def user_only
    if logged_in?
    else
        redirect_to root_path
    end
  end

end
