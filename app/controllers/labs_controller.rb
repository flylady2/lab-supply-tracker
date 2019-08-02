class LabsController < ApplicationController



  def new
    @lab = Lab.new
    render :new
  end

  def create
    @lab = Lab.new(lab_params)
  end

  def show
    set_lab
  end

  private
  def lab_params
    params.require(:lab).permit(:principal_investigator, :institution)
  end

  def set_lab
    @lab = Lab.find(params[:id])
    if !@lab.users.include?(current_user)
      flash[:message] = "Access to lab pages is restricted to members of that lab."
      redirect_to '/'
    end
  end



end
