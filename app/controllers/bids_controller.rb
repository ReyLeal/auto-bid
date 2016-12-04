class BidsController < ApplicationController
  before_action :authorize

  def create
    @bid = Bid.new(bid_params)
    @bid.dealer = current_dealer
    if @bid.save
      ActionCable.server.broadcast 'bids',
       bid: @bid.bid_amount,
       dealer: @bid.dealer.dealer_name.capitalize,
       company: @bid.dealer.company_name.capitalize
       head :ok
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:bid_amount, :auction_id, :dealer_id, :user_id)
  end
end
