class User < ApplicationRecord
  has_secure_password
  require 'securerandom'

  belongs_to :lab
  has_many :reagent_uses
  has_many :reagents, through: :reagent_uses

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :name, uniqueness: { scope: :lab_id}

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

  def lab_attributes=(lab_params)
    lab = Lab.find_or_create_by(lab_params)
    self.lab = lab if lab.valid?
  end

  scope :order_by_name, -> {order(:name)}
  scope :search_by_consumer_name, -> (search_name){where('lower(name) like ?', "%#{search_name.downcase}%")}
  scope :most_active, -> {User.joins(:reagent_uses).group(:user_id).order("count(reagent_uses.user_id) desc").limit(1).first}

end
