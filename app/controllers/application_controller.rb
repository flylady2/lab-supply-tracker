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

  def require_admin
    unless current_user.admin
      flash[:message] = "You must be an administrator to access this function."
      @lab = Lab.find(current_user.lab_id)
      redirect_to lab_path(@lab)
    end
  end

  def require_membership
    unless @lab.users.include?(current_user)
      flash[:message] = "You may only access your own lab's pages."
      redirect_to '/'
    end
  end





end
