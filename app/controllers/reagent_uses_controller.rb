class ReagentUsesController < ApplicationController

  def new
    #byebug
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])
      user_id = current_user.id
      @reagent_use = @reagent.reagent_use.build
      #byebug
    #else
      #@reagent_use = ReagentUse.new
      #@reagent_use.build_reagent
    end
  end

  def create
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])
      @reagent_use = @reagent.reagent_uses.build(reagent_use_params)
    end
    if @reagent_use.save
      redirect_to reagent_path(@reagent)
    else
      render :new
    end
  end

  private
  def reagent_use_params
    params.require(:reagent).permit(:reagent_id, :user_id, :unit, :quantity, :date)
  end
end
