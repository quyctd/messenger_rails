class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :last_20_messages, -> { order(:created_at).last(20) }
end
