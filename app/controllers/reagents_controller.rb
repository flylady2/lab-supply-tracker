class ReagentsController < ApplicationController

  def ask
    #if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
    #if params[:name]

      #UserMailer.with(user: @user, lab: @user.lab).request_reagent_email.deliver_now
      @lab = Lab.find_by_id(params[:lab_id])
      if params[:lab_id] && params[:name]
      #byebug
        UserMailer.with(user: current_user, lab: @lab, name: params[:name]).ask_email.deliver_now
      end
      flash[:message] = "Your reagent request has been sent."
      redirect_to lab_path(@lab)
    end
    #else
      #redirect_to '/'
    #end
  #end

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
    else
      redirect_to '/'
    end
  end

  def new
    #byebug
    if !current_user.admin
      flash[:message] = "You are not authorized to add a reagent"
      redirect_to lab_path(Lab.find_by_id(params[:lab_id]))
    end
    #set_reagent_lab
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
    byebug
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @reagent = @lab.reagents.build(reagent_params)
    else
      @reagent = Reagent.new(reagent_params)
    end
    if @reagent.save
      #byebug
      redirect_to lab_reagent_path(@lab, @reagent)
    else

      render :new
    end
  end

  def show

    @reagent = Reagent.find(params[:id])
    @user = current_user
  end

  def edit
    @reagent = Reagent.find(params[:id])
    @lab = Lab.find(@reagent.lab_id)
    #if !@lab.users.include?(current_user) ||
    if !current_user.admin
      flash[:message] = "You are not authorized to view the edit page."
      redirect_to lab_reagent_path(@lab, @reagent)
    else
      render :edit
    end
  end

  def update
    @reagent = Reagent.find(params[:id])
    if @reagent.update(reagent_params)
      redirect_to reagent_path(@reagent)
    else
      render :edit
    end
  end

  def delete
    @reagent = Reagent.find(params[:id])
    @reagent.destroy
  end



  private
  def reagent_params
    params.require(:reagent).permit(:lab_id, :name, :category_id, :source, :unit, :quantity, :trigger, :location_id, category_attributes:[:name])
  end

  def set_reagent_lab
    @lab = Lab.find(params[:lab_id])
    if !@lab.users.include?(current_user)
      flash[:message] = "Access to lab pages is restricted to members of that lab."
      redirect_to '/'
    end
  end

end
