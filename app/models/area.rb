class Area < ActiveRecord::Base
  attr_accessible :name

  has_many :area_users

  validates :name, presence: true
end
