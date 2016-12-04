class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true


  has_many :auctions
  has_many :bids

  has_secure_password

end
