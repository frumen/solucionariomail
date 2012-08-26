class Question < ActiveRecord::Base
  attr_accessible :area_id, :content, :level, :title
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  validates :title, presence: true

  default_scope order: 'questions.created_at DESC'
end
