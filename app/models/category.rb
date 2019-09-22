class Category < ApplicationRecord
  has_many :reagents
  validates :name, presence: true
  validates :name, uniqueness: true


  def self.lab_categories(reagents)
    lab_categories_array = []
    reagents.each do |reagent|
      lab_categories_array << reagent.category
    end
    lab_categories_array.uniq
  end
#scope :lab_reagent_categories, -> (lab){Category.joins(:reagent).where(lab_id: lab.id)}

end
