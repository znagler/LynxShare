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
    render :json => data
  end

  def create
    link = current_user.links.create(link_params)
    link.create_tags(format_tags(params[:tags]))
    redirect_to '/links'
  end

  def destroy
    Link.find(params[:id]).destroy
    redirect_to '/links'
  end
  private

  def link_params
      params.require(:link).permit(:url)
  end

end
