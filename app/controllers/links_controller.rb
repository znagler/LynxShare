class LinksController < ApplicationController
  include LinksHelper

  def index
    @links = fetch_links(10,current_user.id)
    # binding.pry
  end

  def new
    @link = Link.new
  end

  def ajax
    link_array = fetch_links(10,current_user.id,params["currentString"])
    render(:partial => "link_container", :locals => {:links => link_array})
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
