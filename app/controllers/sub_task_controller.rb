class SubTaskController < ApplicationController

  def new
    @sub_task = SubTask.new
  end

  def create 
    #render plain: params[:post].inspect
    @sub_task = SubTask.new(sub_task_params)
    @sub_task.major_task_id = MajorTask.find(params[:major_task_id])
    if @sub_task.save
      redirect_to root_path(@user)
    end
  end

  private
  def sub_task_params
    params.require(:sub_task).permit(:text, :start_date, :end_date, :time_duration)
  end

end
