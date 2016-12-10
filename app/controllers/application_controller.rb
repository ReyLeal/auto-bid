class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
# CREATES A CURRENT USER METHOD TO TRACK IF A CURRENT USER IS LOGGED IN.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # CREATES A CURRENT DEALER METHOD TO TRACK IF A CURRENT DEALER IS LOGGED IN.
  def current_dealer
    @current_dealer ||= Dealer.find(session[:dealer_id]) if session[:dealer_id]
  end
  helper_method :current_user
  helper_method :current_dealer
# AUTHORIZE ONLY IF THERE IS A CURRENT USER OR A CURRENT DEALER.
  def authorize
    redirect_to '/' unless current_user || current_dealer
  end

end
