class LinksController < ApplicationController

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end
  
end
