# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(255)
#  area_id    :integer
#  level      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :area_id, :content, :level, :title, :user_id
  belongs_to :user
  belongs_to :area
  has_many :answers, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  validates :title, presence: true

  default_scope order: 'questions.created_at DESC'
end
