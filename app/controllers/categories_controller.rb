class CategoriesController < ApplicationController

  def index
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @categories = @lab.categories_by_lab
    else
      @categories = Category.all
    end
  end

  def show
    @category = Category.find(params[:id])
    @lab = Lab.find(params[:lab_id])
    @reagents = @category.reagents & @lab.reagents
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
