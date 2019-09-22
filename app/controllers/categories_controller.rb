class CategoriesController < ApplicationController

  def index
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      #@categories = Category.lab_reagent_categories(@lab)
      @reagents = @lab.reagents
      @categories = Category.lab_categories(@reagents)

    else
      @categories = Category.all
    end
  end

  def show
    @category = Category.find(params[:id])
    @lab = Lab.find(params[:lab_id])
    @reagents = Reagent.lab_reagents_by_category(@lab, @category)
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
