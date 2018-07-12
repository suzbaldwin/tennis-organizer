class TennisBag < ActiveRecord::Base
  has_many :racquets
  belongs_to :user

end
