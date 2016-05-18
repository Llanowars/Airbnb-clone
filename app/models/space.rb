class Space < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_attachment :photo
end
