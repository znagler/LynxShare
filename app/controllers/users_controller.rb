class UsersController < ApplicationController
  include SessionsHelper
  include TagsHelper

  def new
    @user = User.new
  end

  def index
    @users = User.all.take(10)
    @relationship = Relationship.new
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

  def search
    tag_array = fetch_tags(10,current_user.id,params["currentString"])
    render(:partial => "tag_container", :locals => {:tags => tag_array})
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
