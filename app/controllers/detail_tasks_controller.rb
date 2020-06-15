class DetailTasksController < ApplicationController
  
  def new
    @detail_task = DetailTask.new
  end

  def create 
    # render plain: params.inspect
    @detail_task = DetailTask.new(detail_task_params)
    @detail_task.sub_task_id = params[:sub_task_id]
    if @detail_task.save
      redirect_to root_path()
    end
  end

  private
  def detail_task_params
    params.require(:detail_task).permit(:text, :start_date, :end_date, :time_duration)
  end

end
