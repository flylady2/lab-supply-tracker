class UsersController < ApplicationController
  before_action :require_admin, only: [:index]
  skip_before_action :require_login, only: [:new, :create]

def index
  if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
    require_membership
    @users = @lab.users.order_by_name
  else
    flash[:message] = "That information is lab-specific."
    redirect_to '/'
  end
end

#load the signup form
def new
  if params[:lab_id] && @lab = Lab.find_by(params[:lab_id])
    @user = @lab.users.build
  else
    @user = User.new
    @user.build_lab
  end
end

#sign up new user
def create
  if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
    @user = @lab.build_user(user_params)
  else
    @user = User.new(user_params)
  end
  if @user.save
    session[:user_id] = @user.id
    UserMailer.with(user: @user).welcome_email.deliver_now
    UserMailer.with(user: @user, lab: @user.lab).new_user_notification_email.deliver_now
    redirect_to lab_path(@user.lab_id)
  else
    render :new
  end
end

def show
  @user = User.find_by_id(params[:id])
  if current_user != @user
    flash[:message] = "You are not authorized to view those records."
    redirect_to lab_path(@current_user.lab_id)
  else
    render :show
  end
end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :lab_id, :admin, lab_attributes:[:principal_investigator, :institution])
  end
end
