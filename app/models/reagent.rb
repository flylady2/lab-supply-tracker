class Reagent < ApplicationRecord
  belongs_to :lab
  belongs_to :location
  belongs_to :category
  has_many :reagent_uses
  has_many :users, through: :reagent_uses

  #def self.search_by_name(search_name)
    #Reagent.arel_table[:name].lower.matches("%#{search_name.downcase}%")
  #end

  scope :search_by_name, -> (search_name){where('lower(name) = ?', search_name.downcase)}

end
