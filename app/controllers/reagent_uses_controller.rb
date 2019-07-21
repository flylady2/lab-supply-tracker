class ReagentUsesController < ApplicationController

  def index
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagent_uses = @lab.reagent_uses
    else
      @reagent_uses = ReagentUse.all
    end
  end


  def new
    @current_user = User.find_by(id: session[:user_id])

    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])

      @reagent_use = @reagent.reagent_uses.build
      #render :new

      #byebug
    #else
      #@reagent_use = ReagentUse.new
      #@reagent_use.build_reagent
    end
  end

  def create
    #byebug
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])

      @reagent_use = @reagent.reagent_uses.build(reagent_use_params)
    end
    if @reagent_use.quantity > @reagent.quantity
      flash[:message] = "Sorry. There is not enough of this reagent for your experiment."
      redirect_to reagent_path(@reagent)
    else
      #byebug
    @reagent_use.save
    #byebug
    flash[:message] = @reagent_use.enough
    #byebug
    redirect_to reagent_reagent_use_path(@reagent, @reagent_use)

    end
  end

  def show
    @reagent_use = ReagentUse.find(params[:id])
  end

  private
  def reagent_use_params
    params.require(:reagent_use).permit(:reagent_id, :user_id, :lab_id, :unit, :quantity, :date)
  end
end
