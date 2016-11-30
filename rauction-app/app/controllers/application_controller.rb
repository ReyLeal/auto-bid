class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def current_dealer
    @current_dealer ||= Dealer.find(session[:dealer_id]) if session[:dealer_id]
  end

  helper_method :current_user
  helper_method :current_dealer

  def authorize
    redirect_to '/login' unless current_user || current_dealer
  end

end
