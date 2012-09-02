# == Schema Information
#
# Table name: area_users
#
#  id         :integer          not null, primary key
#  area_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AreaUser < ActiveRecord::Base
  attr_accessible :area_id

  belongs_to :user
  belongs_to :area
 
end
