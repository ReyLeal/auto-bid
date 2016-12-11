class DealersController < ApplicationController

  def index
    @auctions = Auction.all
    @dealer = Dealer.find(params[:id])
    # below the @distances variable is created to call the MapsRequest class created in classes/maps_request.rb
    # Mapsrequest makes a request to the google maps matrix api that takes two points on a map and returns distance between them in miles.
    @distances = @auctions.map do |auct|
      MapsRequest.new(auct.latitude, auct.longitude, @dealer.latitude, @dealer.longitude).distance.delete(",").split(" ").first.to_f
    end
  end

  def new
    @dealer = Dealer.new

  end

  def create
    @dealer = Dealer.new(dealer_params)
     if @dealer.save
       session[:dealer_id] = @dealer.id
       redirect_to '/'
     else
       redirect_to '/'
     end
  end

  def update
    @dealer = Dealer.find(params[:id])

      if @dealer.update(dealer_params)
        redirect_to @dealer
      else
        render 'edit'
      end
  end

  def show
    @dealer= Dealer.find(params[:id])
  end

  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy

    redirect_to dealers_path
  end

  private
  def dealer_params
    params.require(:dealer).permit(:company_name, :dealer_name, :address, :email, :phone, :photo, :password, :password_confirmation)
  end
end
