class Location < ApplicationRecord
  belongs_to :lab
  has_many :reagents

  
end
