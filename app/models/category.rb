class Category < ApplicationRecord
  has_many :reagents
  validates :name, presence: true

  #scope :reagents_by_lab, -> ()
end
