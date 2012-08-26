class Answer < ActiveRecord::Base
  attr_accessible :content, :points, :user_id
  belongs_to :question
  belongs_to :writer, class_name: "User", foreign_key: "user_id"

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }

  default_scope order: 'answers.created_at'
end
