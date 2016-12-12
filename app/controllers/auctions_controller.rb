class AuctionsController < ApplicationController
  before_action :authorize
  skip_before_filter :verify_authenticity_token, :only => [:update]

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
  # CREATE A NEW AUCTION AND PASS IN THE USER ID.
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
    @bid = Bid.new
    @bids = Bid.where(auction_id: @auction.id)
    # below I made an if statement to make it so that if an auction is expired, dealers can no longer see them.
    if current_dealer && Time.now.to_i > @auction.expiration_date.to_time.to_i
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end
  def is_current_dealer
    render json: {current_dealer: !!current_dealer}
  end
  def edmunds_key
    render json: {edmunds_key: ENV['EDMUNDS_API_KEY']}
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
