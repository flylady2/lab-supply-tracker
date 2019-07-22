class Category < ApplicationRecord
  has_many :reagents
  validates :name, presence: true
  validates :name, uniqueness: true



end
