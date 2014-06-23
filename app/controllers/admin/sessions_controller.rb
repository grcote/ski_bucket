class Admin::SessionsController < ApplicationController
  def new
    if admin_user_logged_in?
      flash[:error] = "You are already logged in as an admin"
      redirect_to admin_dashboard_path
    else
      @user = User.new
    end
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
