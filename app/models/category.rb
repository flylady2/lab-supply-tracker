class Category < ApplicationRecord
  has_many :reagents
  validates :name, presence: true
  validates :name, uniqueness: true

  #scope :reagents_by_lab, -> ()
end
