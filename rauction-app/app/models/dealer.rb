class Dealer < ApplicationRecord
  has_many :bids, through: :auctions
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
