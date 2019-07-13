class Lab < ApplicationRecord
  has_many :users
  has_many :reagents
  has_many :locations

  validates :principal_investigator, :institution, presence: true
end
