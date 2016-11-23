class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
