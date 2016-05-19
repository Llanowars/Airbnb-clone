class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  has_many :reviews
end
