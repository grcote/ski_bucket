class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :logged_in?
  def logged_in?
    current_user != nil
  end

  helper_method :log_user_out
  def log_user_out
    session[:user_id] = nil
    session[:expire_time] = nil
  end

  helper_method :require_admin
  def require_admin
    if current_user.nil? || admin_user? != true
      flash[:error] = "You must be logged in as an admin to see this page"
      redirect_to admin_login_path
    end
  end

  helper_method :admin_user?
  def admin_user?
    current_user.admin == true
  end
end
