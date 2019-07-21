class Location < ApplicationRecord
  belongs_to :lab
  has_many :reagents

  validates :name, presence: true
  validates :name, uniqueness: { scope: :lab_id, message: "Lab already has this location."}


end
