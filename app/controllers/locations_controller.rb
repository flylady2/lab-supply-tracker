class LocationsController < ApplicationController

  def index
    #only nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @locations = @lab.locations
    end
  end

  def new
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @location = @lab.locations.build
    else
      flash[:message] = "Location must be associated with a lab."
      redirect_to '/'
    end
  end

  def create
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @location = @lab.locations.build(location_params)
    end
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private
  def location_params
    params.require(:location).permit(:name, :lab_id)
  end
end
