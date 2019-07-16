class ReagentsController < ApplicationController

  def index
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagents = @lab.reagents
      if params[:name]
        @reagents = @lab.reagents.search_by_name(params[:name])
      else
        @reagents = @lab.reagents
      end


    else

      redirect_to '/'
    end
  end

  def new
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagent = @lab.reagents.build
    else
      @reagent = Reagent.new
      @reagent.build_lab
    end
  end

  def create
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagent = @lab.reagents.build(reagent_params)
    end
    if @reagent.save
      redirect_to lab_reagent_path(@lab, @reagent)
    else
      render :new
    end
  end

  def show
    @reagent = Reagent.find(params[:id])
  end

  private
  def reagent_params
    params.require(:reagent).permit(:lab_id, :name, :category, :source, :unit, :quantity, :location_id)
  end
end
