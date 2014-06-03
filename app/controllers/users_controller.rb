class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_strong_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Hello #{@user.first_name}, let's turn and burn!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_strong_params)
      flash[:success] = "Account email successfully updated to #{@user.email}"
      redirect_to user_path(@user)
    else
      render :edit
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