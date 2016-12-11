class Dealer < ApplicationRecord
  validates :dealer_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # validations above, and relations explained below
  has_many :auctions
  has_many :bids, through: :auctions
  # The address gets beoken down into a latitude and a longitude by the geocoder gem.
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  has_secure_password
end
