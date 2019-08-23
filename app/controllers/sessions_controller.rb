class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:welcome, :new, :create, :oauth_login]


def index
end

#load login form
def new
  render :login
end

#login user
def create
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    #byebug
    redirect_to lab_path(@user.lab_id)
  else
    redirect_to 'login'
  end
end

def oauth_login
  @user = User.from_omniauth(auth)
  @user.save
  session[:user_id] = @user.id
  #byebug
  redirect_to lab_path(@user.lab_id)
end

  #logout user
def destroy
  session.clear
  redirect_to '/'
end

private

def auth
  request.env['omniauth.auth']
end


end
