class DealersController < ApplicationController
  def index

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
       redirect_to '/register'
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
