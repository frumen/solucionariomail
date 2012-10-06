class Comment < ActiveRecord::Base
  attr_accessible :answer_id, :content, :user_id
  belongs_to :answer
  belongs_to :writer, class_name: "User", foreign_key: "user_id"

  validates :user_id, presence: true
  validates :answer_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  default_scope order: 'comments.created_at'
end
