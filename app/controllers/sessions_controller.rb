class SessionsController < ApplicationController

def index
end

#load login form
def new
  @user = User.new
  #render :login
end

#login user
def create
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to lab_path(@user.lab_id)
  else
    redirect_to 'login'
  end
end

  #logout user
  def destroy
    session.clear
    redirect_to '/'
  end


end
