class Space < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_attachments :photos, maximum: 8
end
