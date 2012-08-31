class AreaUser < ActiveRecord::Base
  attr_accessible :area_id

  belongs_to :user
  belongs_to :area
  
end
