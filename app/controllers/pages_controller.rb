class PagesController < ApplicationController

  def index
    if @current_user
      @current_user
      #@user = User.find(session[:user_id])
    end
  end
end