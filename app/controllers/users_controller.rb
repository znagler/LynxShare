class UsersController < ApplicationController
  include SessionsHelper
  include UsersHelper

  def new
    @user = User.new
  end

  def index
    @user_array = fetch_users(10,current_user.id)
    @relationship = Relationship.new

    # @users = User.all.take(10)
  end

  def search
    user_array = fetch_users(10,current_user.id,params["currentString"])
    # binding.pry
    @relationship = Relationship.new
    render(:partial => "user_container", :locals => {:users => user_array, :relationship => @relationship})
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the sample app!"
      redirect_to '/links'
    else
      render 'new', status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
