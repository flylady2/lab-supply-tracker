class ReagentUsesController < ApplicationController

  def new
    @current_user = User.find_by(id: session[:user_id])
    user_id = @current_user.id
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])

      @reagent_use = @reagent.reagent_uses.build
      render :new

      #byebug
    #else
      #@reagent_use = ReagentUse.new
      #@reagent_use.build_reagent
    end
  end

  def create
    @current_user = User.find_by(id: session[:user_id])
    user_id = @current_user.id
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])

      @reagent_use = @reagent.reagent_uses.build(reagent_use_params)
      #byebug
    @reagent_use.save
    #byebug
    flash[:message] = @reagent_use.enough
    redirect_to reagent_path(@reagent)

    end
  end

  #def update

  private
  def reagent_use_params
    params.require(:reagent_use).permit(:reagent_id, :user_id, :unit, :quantity, :date)
  end
end
