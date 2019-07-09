class LocationsController < ApplicationController

  def index
    #nested routes
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @locations = @lab.locations
      #need alternative
    end
  end

  def new
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @location = @lab.locations.build
      #byebug
    else
      @location = Location.new
      @location.build_lab
    end
  end

  def create
    #byebug
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @location = @lab.locations.build(location_params)
    #else
    #  @location = Location.new(location_params)
    end
    #byebug
    if @location.save
      #byebug
      #@lab = Lab.find_by_id(params[:lab_id])
      redirect_to lab_location_path(@lab, @location)
    else
      render :new
    end
  end

  def show
    #byebug
    @location = Location.find(params[:id])
    #redirect_to location_path(@location)
  end

  private
  def location_params
    params.require(:location).permit(:name, :lab_id)
  end
end
