class Dealer < ApplicationRecord
  validates :dealer_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :bids, through: :auctions
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  has_secure_password
end
