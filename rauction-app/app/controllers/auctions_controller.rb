class AuctionsController < ApplicationController
  before_filter :authorize
  def index
    @auctions = Auction.where(user_id: params[:user_id])
    @auction = Auction.new
  end

  def new
    @auction = Auction.new
  end

  def dealer_index
    @auctions = Auction.all

  end

  def dealer_show

  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save
      redirect_to user_auctions_url(current_user)
    else
      redirect_to '/'
    end
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy

    redirect_to user_auctions_url
  end

  private

  def auction_params
    params.require(:auction).permit(:max_price, :title, :year, :make, :model, :miles_from, :address, :color, :features, :expiration_date, :user_id)
  end

end
