class User < ApplicationRecord
  has_secure_password

  belongs_to :lab
  has_many :reagent_uses
  has_many :reagents, through: :reagent_uses

end
