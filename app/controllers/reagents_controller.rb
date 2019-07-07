class ReagentsController < ApplicationController

  def index
    #nested routes
    if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
      @reagents = lab.reagents
    else
      redirect_to '/'
    end
  end

  def new
    #nested route
    if params[:lab_id] && lab = Lab.find_by_id(params[:lab_id])
      @reagent = lab.reagents.build
    else
      redirect_to '/'
    end
  end

  def create
    @reagent = lab.reagents.build(reagent_params)
    if @reagent.save
      redirect_to lab_reagent_path(@reagent)
    else
      render :new
    end
  end

  private
  def reagent_params(*args)
    params.require(:reagent).permit(*args)
  end
end
