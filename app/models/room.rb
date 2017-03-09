class Room < ActiveRecord::Base
  has_many :messages
  has_many :users
  validates :name, presence: true
end
