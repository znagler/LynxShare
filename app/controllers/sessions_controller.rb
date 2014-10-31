class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to '/links'
    else
      # 'Invalid username/password combination'
      redirect_to login_path
    end
  end

end
