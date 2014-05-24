class SessionsController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Hello #{user.first_name}, let's turn and burn!"
      redirect_to root_url
    else
      flash.now[:error] = "Invalid Email and Password Combination"
      render "new"
    end
  end
end