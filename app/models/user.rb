class User < ApplicationRecord
  has_secure_password
  require 'securerandom'

  belongs_to :lab
  has_many :reagent_uses
  has_many :reagents, through: :reagent_uses

  validates :name, :email, presence: true
  validates :email, uniqueness: true #{message: "That email is already in use."}
  validates :name, uniqueness: { scope: :lab_id} #, message: "Lab already has a user with this name."}

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

  scope :order_by_name, -> {order(:name)}
  scope :search_by_consumer_name, -> (search_name){where('lower(name) like ?', "%#{search_name.downcase}%")}
end
