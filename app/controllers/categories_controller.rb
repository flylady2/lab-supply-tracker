class CategoriesController < ApplicationController

  def new
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
