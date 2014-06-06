class PasswordResetController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:success] = "Check the account you provided for instructions (#{user.email})."
    redirect_to root_path
  end

  def edit
    password_reset_user = User.new.verify_user(params[:token])
    flash[:error] = "Invalid information provided, click \"Forgot Password?\" again."
    redirect_to root_path and return unless password_reset_user

    @user = password_reset_user
    flash[:success] = "Enter your new password."
  end

  def update
    user = User.find(params[:user][:id])
    if user.update(params.require(:user).permit(:password, :password_confirmation))
      flash[:success] = "Success! Login with your updated password."
    else
      flash[:error] = "Password update failed, click \"Forgot Password?\" again."
    end
    redirect_to root_path
  end
end