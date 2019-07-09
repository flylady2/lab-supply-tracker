class LabsController < ApplicationController



def new
  @lab = Lab.new
  render :new
end

def create
  @lab = Lab.new(lab_params)
end

def show
  @lab = Lab.find_by_id(params[:id])
end

private
def lab_params
  params.require(:lab).permit(:principal_investigator, :institution)
end

end
