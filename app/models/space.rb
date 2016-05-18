class Space < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_attachment :photo
end
