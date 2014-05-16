class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_strong_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_strong_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
end