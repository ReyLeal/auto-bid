class Auction < ApplicationRecord
  # Below we are passing validations to the fields that
  # we can not have left blank when creating a new auction
  validates :title, presence: true
  validates :year, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :miles_from, presence: true
  validates :address, presence: true
  validates :expiration_date, presence: true
  validates :max_price, presence: true
  validate :expiration_date_cannot_be_in_the_past
  # Below, we have our relations explained
  belongs_to :user
  has_many :bids
  # Below we uses the geocder gem to break our adress down into a lattitude and longitude
  geocoded_by :address
  # Geocode again if there is a change in the address.
  after_validation :geocode, :if => :address_changed?
  # before_save :price_param
  #
  # def price_param
  #   self.update(max_price: self.max_price.match(/\d+/)[0])
  # end
  # The below method is passed in on line 12.
  # It makes sure that a user can't put an expiration date in the past.
  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end
end
