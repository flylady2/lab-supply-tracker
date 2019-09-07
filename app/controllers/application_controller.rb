class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :require_login

  private


  def require_login
    unless logged_in
      flash[:message] = "You must be logged in to use the app."
      redirect_to '/login'
    end
  end

  




end
