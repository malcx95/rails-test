class User < ActiveRecord::Base
  # has_many :messages
  validates :name, presence: true, length: {minimum: 2}
  validates :password, presence: true, length: {minimum: 2}
end
