class Lab < ApplicationRecord
  has_many :users
  has_many :reagents
  has_many :locations
  has_many :reagent_uses

  validates :principal_investigator, :institution, presence: true
  validates :principal_investigator, uniqueness: { scope: :institution, message: "Institution already has a principal investigator with this name."}

end
