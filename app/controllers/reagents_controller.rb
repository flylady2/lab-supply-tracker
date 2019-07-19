class ReagentsController < ApplicationController

  def search
    #byebug
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      #byebug
      render :search
    else
      redirect_to '/'
    end
  end

  def index
    #byebug
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagents = @lab.reagents
      if params[:name]
        @reagents = @lab.reagents.search_by_name(params[:name])
      else
        @reagents = @lab.reagents
      end
    end
  end

  def new
    if !current_user.admin
      flash[:message] = "You are not authorized to add a reagent"
      redirect_to lab_path(Lab.find_by_id(params[:lab_id]))
    end
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
      #byebug
      redirect_to lab_reagent_path(@lab, @reagent)
    else
      @reagent.build_category unless @reagent.category
      byebug
      render :new
    end
  end

  def show
    @reagent = Reagent.find(params[:id])
  end

  def delete
    @reagent = Reagent.find(params[:id])
    @reagent.destroy
  end



  private
  def reagent_params
    params.require(:reagent).permit(:lab_id, :name, :category_id, :source, :unit, :quantity, :location_id)
  end
end
