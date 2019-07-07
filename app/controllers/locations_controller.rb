class LocationsController < ApplicationController

  def index
    #nested routes
    if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
      @locations = lab.locations
    else
      redirect_to '/'
    end
  end

  def new
    #nested route
    if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
      @location = lab.locations.build
    else
      redirect_to '/'
    end
  end

  def create
    @location = lab.locations.build(location_params)
    if @location.save
      redirect_to lab_location_path(@location)
    else
      render :new
    end
  end

  private
  def location_params
    params.require(:location).permit(location_params)
  end
end
