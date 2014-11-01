class LinksController < ApplicationController

  def index
    @links = current_user.links
  end
  def new
    
  end
end
