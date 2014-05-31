class SessionsController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:login_time] = Time.now
      flash[:success] = "Hello #{user.first_name}, let's turn and burn!"
      redirect_to root_url
    else
      flash.now[:error] = "Invalid Email and Password Combination"
      render "pages/index"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "See you on the slopes!"
    redirect_to root_path
  end
end