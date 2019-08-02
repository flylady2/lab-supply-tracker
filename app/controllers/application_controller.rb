class ApplicationController < ActionController::Base
  before_action :require_login

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in
    !!current_user
  end

  def require_login
    unless logged_in
      flash[:message] = "You must be logged in to use the app."
      redirect_to '/login'
    end
  end



end
