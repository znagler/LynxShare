class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/links"
    else
      render 'new'
    end
  end

end
