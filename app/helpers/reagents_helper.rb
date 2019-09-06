module ReagentsHelper

  def category_array
    category_array = []
    @lab.reagents.each do |reagent|
      category_array << reagent.category
    end
    category_array.uniq
  end


end
