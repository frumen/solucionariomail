# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :score, :area_users_attributes
  has_secure_password
  has_many :questions, dependent: :destroy
  has_many :written_answers, class_name: "Answer", foreign_key: "user_id"
  has_many :area_users
  has_many :areas, through: :area_users, source: :area
  accepts_nested_attributes_for :area_users, allow_destroy: true

  before_save { |user| user.email = email.downcase }

  before_save :create_remember_token

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  					uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


 private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
