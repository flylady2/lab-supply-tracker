class UsersController < ApplicationController

def index
  if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
    @users = @lab.users
  end
end


#loading the signup form
def new
  @user = User.new
end

#signup
def create
  #byebug
  if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
    @user = @lab.build_user(user_params)
  else
    @user = User.new(user_params)
    #put choose_lab route here
  end
  #byebug
  if @user.save
    session[:user_id] = @user.id
    UserMailer.with(user: @user).welcome_email.deliver_now
    UserMailer.with(user: @user, lab: @user.lab).new_user_notification_email.deliver_now
    redirect_to lab_path(@user.lab_id)
  else
    render :new
  end
  #else
    #flash[:message] = "You must be a member of a participating lab to sign up"
  #  redirect_to '/' #home or welcome page
  #end
end

def show
  @user = User.find_by_id(params[:id])
end






  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :lab_id, :admin)
  end
end
