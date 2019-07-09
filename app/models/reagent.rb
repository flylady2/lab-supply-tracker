class Reagent < ApplicationRecord
  belongs_to :lab
  belongs_to :location
  has_many :reagent_uses
  has_many :users, through: :reagent_uses
end
