class UsersController < ApplicationController
  include SessionsHelper  
  
  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the sample app!"
      redirect_to current_user
    else
      render 'new'  
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end