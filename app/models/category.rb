class Category < ApplicationRecord
  has_many :reagents
  validates :name, presence: true
end
