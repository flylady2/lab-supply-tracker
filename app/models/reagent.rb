class Reagent < ApplicationRecord
  belongs_to :lab
  belongs_to :location
  belongs_to :category
  has_many :reagent_uses
  has_many :users, through: :reagent_uses

  validates :name, :unit, :quantity, :source, presence: true


  def category_attributes=(category_params)
    category = Category.find_or_create_by(category_params)
    self.category = category if category.valid?
  end


  #def self.search_by_name(search_name)
    #Reagent.arel_table[:name].lower.matches("%#{search_name.downcase}%")
  #end

  scope :search_by_name, -> (search_name){where('lower(name) like ?', "%#{search_name.downcase}%")}

end
