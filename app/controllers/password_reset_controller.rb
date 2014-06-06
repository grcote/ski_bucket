class PasswordResetController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    Notifier.password_reset_email(user, SecureTokens.password_reset_for(user)).deliver if user.present?
    flash[:success] = "Check the account you provided for instructions (#{params[:email]})."
    redirect_to root_path
  end

  def edit
    begin
      user_id = SecureTokens.verify_password_reset_token(params[:token])
      @user = User.find(user_id)
    rescue SecureTokens::InvalidPasswordResetToken
      flash[:error] = "Invalid information provided, click \"Forgot Password?\" again."
      redirect_to root_path
      return
    end
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