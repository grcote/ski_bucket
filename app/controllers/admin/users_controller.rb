class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_strong_params)
    if @user.save
      flash[:success] = "User successfully added"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private

  def user_strong_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end