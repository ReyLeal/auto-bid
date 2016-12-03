class BidsController < ApplicationController
  before_filter :authorize
  validates :bid_amount, presence: true
end
