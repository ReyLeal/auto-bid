class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
       session[:user_id] = user.id
       redirect_to @user
     else
       redirect_to '/signup'
     end
  end

  def update
    @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
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
    params.require(:user).permit(:name, :password, :email, :phone, :photo)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :photo, :password, :password_confirmation)
  end
end
