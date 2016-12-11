class BidsController < ApplicationController
  before_action :authorize

  def create
    @bid = Bid.new(bid_params)
    @auction = Auction.find(@bid.auction_id)
    @bid.dealer = current_dealer
    # Render error if a bid is less tham 0.
    render :bad_request if @bid.bid_amount <= 0
    # if a bid is empty and the bid amount is less than or equal to the max price for the auction, then allow save.
    if @auction.bids.empty? &&
      @bid.bid_amount <= @auction.max_price &&
      @bid.save
      # return_bid is a private method below that passes certain specified values to be used by action cable.
      return_bid
      # below if a an auction already has bids, and the new bid is less than the last bid made on the auction, then allow save and call the return_bid method.
    elsif @bid.bid_amount < @auction.bids.last.bid_amount && @bid.save
      return_bid
    end
  end

  def destroy
    @bid = Bid.find(params[:bid_id])
    @bid.destroy
    redirect_to user_auction_path(params[:user_id], params[:auction_id])
  end
  private
# The delete_link was made so that we could pass it in to return_bid (below).
# What delete_link does, is it passes the html that makes up the "delete" bid button. So that we can use it only if the dealer is a current dealer.
  def delete_link
      first_half_link = "<a data-confirm='Are you sure?' id='destroy' rel='nofollow' \
      data-method='delete' href='http://localhost:3000/bids/2?auction_id=2&amp;bid_id=330&amp;user_id=2'>"
      first_half_link += "<button class='top-cta-button btn-user-auc btn-delete' type='button'>Delete Bid</button>" if current_dealer
      first_half_link += "</a>"
      first_half_link
    end

    def bid_params
      params.require(:bid).permit(:bid_amount, :auction_id, :dealer_id, :user_id)
    end

    def return_bid
      mikes_var = {bid: @bid.bid_amount,
      dealer: @bid.dealer.dealer_name.capitalize,
      company: @bid.dealer.company_name.capitalize,
      email: @bid.dealer.email}
      mikes_var.merge!(delete: delete_link) if current_dealer == @bid.dealer
      head :ok
      ActionCable.server.broadcast 'bids', mikes_var
    end
  end
