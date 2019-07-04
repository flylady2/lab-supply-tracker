class Location < ApplicationRecord
  belongs_to :laboratory
  has_many :reagents
end
