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
    #else
      #@location = Location.new
      #@location.build_lab
    end
  end

  def create
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @location = @lab.locations.build(location_params)
    #else
    #  @location = Location.new(location_params)
    end
    #byebug
    if @location.save
      redirect_to lab_location_path(@lab, @location)
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
