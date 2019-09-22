class ReagentsController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :destroy]

  def most_used
    @reagents = Reagent.most_used
  end

  def most_used_lab_reagent
    lab = current_user.lab
    @reagents = Reagent.most_used_lab_reagent(lab)
  end

  def ask
    @lab = Lab.find_by_id(params[:lab_id])
    require_membership
    if params[:lab_id] && params[:name] != ""
      AdminMailer.with(user: current_user, lab: @lab, name: params[:name]).ask_email.deliver_now
      flash[:message] = "Your reagent request has been sent."
      redirect_to lab_path(@lab)
    else
      flash[:message] = "There was a problem with your reagent request."
      redirect_to lab_path(@lab)
    end
  end

  def index
    #only nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      require_membership
      if params[:name] == nil || params[:name] == ""
          @reagents = Reagent.lab_reagents(@lab)#@lab.reagents
      else
        @reagents = @lab.reagents.search_by_name(params[:name])
      end
    else
      flash[:message] = "That information is not available."
      redirect_to '/'
    end
  end

  def new
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      require_membership
      @reagent = @lab.reagents.build
      @category = @reagent.build_category
    else
      flash[:message] = "New reagents must be associated with an existing lab. "
      redirect_to '/'
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
    set_reagent_and_lab
    require_membership
  end

  def edit
    set_reagent
  end

  def update
    set_reagent
    if @reagent.update(reagent_params)
      redirect_to reagent_path(@reagent)
    else
      render :edit
    end
  end

  def destroy
    set_reagent_and_lab
    require_membership
    @reagent.destroy
    redirect_to lab_path(@lab)
  end



  private
  def reagent_params
    params.require(:reagent).permit(:lab_id, :name, :category_id, :source, :unit, :quantity, :trigger, :location_id, category_attributes:[:name])
  end

  def set_reagent
    @reagent = Reagent.find(params[:id])
  end

  def set_reagent_and_lab
    set_reagent
    @lab = Lab.find(@reagent.lab_id)
  end


end
