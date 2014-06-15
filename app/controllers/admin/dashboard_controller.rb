class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index

  end

  private

  def require_admin
    if current_user.nil? || current_user.admin != true
      flash[:error] = "You must be logged in as an admin to see this page"
      redirect_to admin_login_path
    end
  end
end
