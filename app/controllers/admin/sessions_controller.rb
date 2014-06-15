class Admin::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:login_time] = Time.now
      flash[:success] = "Hello #{user.first_name}, welcome to the Ski Bucket Admin Dashboard"
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = "Invalid Email and Password Combination"
      render "admin/sessions/new"
    end
  end
end
