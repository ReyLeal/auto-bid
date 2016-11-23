class AuctionsController < ApplicationController

  def index
    @auction = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction.new(auction_params)
    if @auction.save
      # session[:dealer_id] = dealer.id
      redirect_to @auction
    else
      render 'new'
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
    params.require(:auction).permit(:max_price, :title, :year, :make, :model, :miles_from, :address, :color, :features, :expiration_date)
  end

end
