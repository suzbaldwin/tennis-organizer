class User < ActiveRecord::Base
  has_secure_password
  has_many :tennis_bags
  validates :name, presence: true
  validates :password_digest, presence: true
  validates :name, uniqueness: true
end
