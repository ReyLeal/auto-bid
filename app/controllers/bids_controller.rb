class BidsController < ApplicationController
  before_action :authorize

  def create
    @bid = Bid.new(bid_params)
    @auction = Auction.find(@bid.auction_id)
    @bid.dealer = current_dealer
    render :bad_request if @bid.bid_amount == 0
    if @auction.bids.empty? && @bid.save
      return_bid
    elsif @bid.bid_amount <= @auction.bids.last.bid_amount && @bid.save
      return_bid
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amount, :auction_id, :dealer_id, :user_id)
  end

  def return_bid
    ActionCable.server.broadcast 'bids',
    bid: @bid.bid_amount,
    dealer: @bid.dealer.dealer_name.capitalize,
    company: @bid.dealer.company_name.capitalize,
    email: @bid.dealer.email
    head :ok
  end
end
