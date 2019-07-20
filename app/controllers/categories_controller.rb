class CategoriesController < ApplicationController

  def index
    #byebug
    #nested route
    if params[:lab_id] && @lab = Lab.find_by_id(params[:lab_id])
      @categories = @lab.reagents
      #byebug
      if params[:name]
        @categories = @categories.search_by_name(params[:name])
      else
        @categories = @lab.reagents
      end
    end
  end

  def new
  end

  def create
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
