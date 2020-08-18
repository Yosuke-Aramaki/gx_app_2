class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def get_task_list_for_specific_period
    # render plain: params.inspect
    @user = current_user
    @detail_task = @user.detail_tasks.where("date <= ? OR date >= ?", params[:detail_task][:start_date], params[:detail_task][:end_date]).order(:sub_task_id)
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
