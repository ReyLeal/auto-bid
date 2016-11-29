class AuctionsController < ApplicationController
  before_filter :authorize

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save
      redirect_to '/'
    else
      redirect_to new_user_auction_url(current_user)
    end
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy

    redirect_to auctions_path
  end

  private
  def auction_params
    params.require(:auction).permit(:max_price, :title, :year, :make, :model, :miles_from, :address, :color, :features, :expiration_date, :user_id)
  end
end
