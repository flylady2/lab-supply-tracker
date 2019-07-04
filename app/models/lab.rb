class Lab < ApplicationRecord
  has_many :users
  has_many :reagents
  has_many :locations
end
