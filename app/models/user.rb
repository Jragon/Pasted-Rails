class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :username

  has_many :pastes

  validates :username, :password, presence: true
  validates :username, length: { maximum: 25 }

  has_secure_password
end
