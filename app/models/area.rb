class Area < ActiveRecord::Base
  attr_accessible :name

  has_many :area_users
  has_many :questions

  validates :name, presence: true

  default_scope order: 'areas.name'
end
