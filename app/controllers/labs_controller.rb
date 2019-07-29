class LabsController < ApplicationController



def new
  @lab = Lab.new
  render :new
end

def create
  @lab = Lab.new(lab_params)
end

def show
  if logged_in
    @lab = Lab.find_by_id(params[:id])
  else
    flash[:message] = "You must be logged in to view your lab page."
    redirect_to '/'
  end
end

private
def lab_params
  params.require(:lab).permit(:principal_investigator, :institution)
end

end
