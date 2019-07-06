class LabsController < ApplicationController

private

def new
  @lab = Lab.new
render

def create
  @lab = Lab.new(lab_params)
end

def lab_params
  params.require(:lab).permit(:principal_investigator, :location)
end
end
