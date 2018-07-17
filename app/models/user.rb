class User < ActiveRecord::Base
  has_secure_password
  has_many :tennis_bags
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :username, uniqueness: true
end
