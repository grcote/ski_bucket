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

    if password_reset_user
      if password_reset_user == 'expired_token'
        flash[:error] = "Your token has expired, click \"Forgot Password?\" again."
        render 'pages/index'
      else
        @user = password_reset_user
        flash[:success] = "Enter your new password."
      end
    else
      flash[:error] = "Invalid information provided, click \"Forgot Password?\" again."
      redirect_to root_path
    end
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