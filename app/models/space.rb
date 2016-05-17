class Space < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
