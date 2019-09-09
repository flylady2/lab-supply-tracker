class ReagentUsesController < ApplicationController
  include ReagentUsesSorter


  def index
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      if !@lab.users.include?(current_user)
        flash[:message] = "You are not authorized to see those records."
        redirect_to '/'
      end
      if !params[:reagent] #no search term
        @reagent_uses = @lab.reagent_uses
      elsif params[:reagent] != "" || params[:consumer] != "" || params[:start_date] != ""
        sorter #search term present
      else #empty search term
        @reagent_uses = @lab.reagent_uses
      end
    else
      flash[:message] = "Reagent_use records must be asociated with a lab."
      redirect_to '/'
    end
  end


  def new #nested under reagents[:show]
    @current_user = User.find_by(id: session[:user_id])
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])
      @reagent_use = @reagent.reagent_uses.build
    end
  end

  def create #nested under reagents[:show]
    if params[:reagent_id] && @reagent = Reagent.find_by_id(params[:reagent_id])
      @reagent_use = @reagent.reagent_uses.build(reagent_use_params)
    end
    if @reagent_use.quantity > @reagent.quantity #reagent_use rejected
      flash[:message] = "Sorry. There is not enough of this reagent for your experiment."
      redirect_to reagent_path(@reagent)
    else
    @reagent_use.save  #reagent_use accepted
    @reagent_use.enough #calculates new quantity, sends email if trigger activated
    flash[:message] = "Thank you for recording your reagent use."
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
