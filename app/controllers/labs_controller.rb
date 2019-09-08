class LabsController < ApplicationController

  def admin
    @lab = Lab.find_by(params[:lab_id])
    if @lab.users.include?(current_user) && current_user.admin
      render :admin
    else
      flash[:message] = "Access to admin functions is restricted to users with admin status."
      redirect_to '/'
    end
  end

  def show
    @lab = Lab.find(params[:id])
    if !@lab.users.include?(current_user)
      flash[:message] = "Access to lab pages is restricted to members of that lab."
      redirect_to '/'
    end
  end

  private
  def lab_params
    params.require(:lab).permit(:principal_investigator, :institution)
  end



end
