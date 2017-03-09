class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  default_scope -> { order('created_at DESC') }
  validates :body, presence: true, length: { maximum: 250 }
  validates :user_id, presence: true
end
