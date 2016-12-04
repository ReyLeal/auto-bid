class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    dealer = Dealer.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    elsif dealer && dealer.authenticate(params[:password])
      session[:dealer_id] = dealer.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy_user
    session[:user_id] = nil
    redirect_to '/'
  end
  def destroy_dealer
    session[:dealer_id] = nil
    redirect_to '/'
  end
end
