class Message < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :body, length: { minimum: 1 }
end
