class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :content, presence: true
  validates :user, presence: true
  validates :room, presence: true
end
