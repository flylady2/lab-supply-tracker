class UsersController < ApplicationController

#def index
  #@trainers = Trainer.all
#end

#loading the signup form
def new
  @user = User.new
end

#signup
def create
  #byebug
  if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
    @user = lab.build_user(user_params)
  else
    @user = User.new(user_params)
  end
  byebug
  if @user.save
    session[:user_id] = @user.id
    redirect_to users_home_path(@user)
  else
    render :new
  end
  #else
    #flash[:message] = "You must be a member of a participating lab to sign up"
  #  redirect_to '/' #home or welcome page
  #end
end






  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :lab_id, :admin)
  end
end
