class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  belongs_to :dealer
end
