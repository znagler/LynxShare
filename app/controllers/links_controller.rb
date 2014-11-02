class LinksController < ApplicationController
  include LinksHelper

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end


  def ajax
    puts "*"*100
    puts params["currentString"]
    puts "*"*100
    data = fetch_links(10,2)
    # binding.pry
    # data = {this: "lol"}
    render :json => data
  end

  def create
    # binding.pry
    current_user.links.create(link_params)
    redirect_to '/links'
  end

  private

  def link_params
      params.require(:link).permit(:url)
  end

end
