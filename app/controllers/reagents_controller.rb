class ReagentsController < ApplicationController

  def ask
    @lab = Lab.find_by_id(params[:lab_id])
    if params[:lab_id] && params[:name] != ""
      UserMailer.with(user: current_user, lab: @lab, name: params[:name]).ask_email.deliver_now
      flash[:message] = "Your reagent request has been sent."
      redirect_to lab_path(@lab)
    else
      flash[:message] = "There was a problem with your reagent request."
      redirect_to lab_path(@lab)
    end
  end

  def index
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      if params[:name] != ""
        @reagents = @lab.reagents.search_by_name(params[:name])
      else
        @reagents = @lab.reagents
      end
    else
      flash[:message] = "That information is not available."
      redirect_to '/'
    end
  end

  def new
    if !current_user.admin
      flash[:message] = "You are not authorized to add a reagent"
      redirect_to lab_path(Lab.find_by_id(params[:lab_id]))
    end
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagent = @lab.reagents.build
      @category = @reagent.build_category
    else
      @reagent = Reagent.new
      @reagent.build_lab
      @category = @reagent.build_category
    end
  end

  def create
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagent = @lab.reagents.build(reagent_params)
    else
      @reagent = Reagent.new(reagent_params)
    end
    if @reagent.save
      redirect_to lab_reagent_path(@lab, @reagent)
    else
      render :new
    end
  end


  def show
    set_reagent
    @user = current_user
  end

  def edit
    set_reagent
    @lab = Lab.find(@reagent.lab_id)
    if !current_user.admin
      flash[:message] = "You are not authorized to view the edit page."
      redirect_to lab_reagent_path(@lab, @reagent)
    else
      render :edit
    end
  end

  def update
    set_reagent
    if @reagent.update(reagent_params)
      redirect_to reagent_path(@reagent)
    else
      render :edit
    end
  end

  def delete
    set_reagent
    @reagent.destroy
  end



  private
  def reagent_params
    params.require(:reagent).permit(:lab_id, :name, :category_id, :source, :unit, :quantity, :trigger, :location_id, category_attributes:[:name])
  end

  def set_reagent
    @reagent = Reagent.find(params[:id])
  end


end
