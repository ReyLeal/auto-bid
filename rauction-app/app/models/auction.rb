class Auction < ApplicationRecord
  validates :title, presence: true
  validates :year, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :miles_from, presence: true
  validates :address, presence: true
  validates :expiration_date, presence: true
  validates :max_price, presence: true

  belongs_to :user
  has_many :bids
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
