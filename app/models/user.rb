class User < ApplicationRecord
  has_secure_password

  belongs_to :lab
  has_many :reagent_uses
  has_many :reagents, through: :reagent_uses

  validates :name, :email, presence: true
  validates :email, uniqueness: true

end
