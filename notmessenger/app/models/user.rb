class User < ActiveRecord::Base
  has_many :messages, :foreign_key => 'user_id'
  validates :name, presence: true, length: {minimum: 2}

  validates :password, presence: true, length: {minimum: 2}
end
