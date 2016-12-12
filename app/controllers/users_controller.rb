class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:update]

  def index
     @user = User.find_by(@current_user) || User.new
     @dealer = Dealer.new
     @auction = Auction.new
   end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/'
    end
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render '/'
    end
  end


  def show
    @user= User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :photo, :password, :password_confirmation)
  end
end
