class SessionsController < ApplicationController
  include SessionsHelper

  def new
    @current_user= current_user
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/links"
    else
      # 'Invalid username/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
  # reset_session
      # flash[:success] = ["You have signed out successfully."]
      redirect_to root_url
  end

end
