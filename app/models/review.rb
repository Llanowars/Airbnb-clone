class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :space
  belongs_to :reservation
end
