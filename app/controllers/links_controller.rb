class LinksController < ApplicationController

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    binding.pry
    current_user.links.create(link_params)
    redirect_to '/links'
  end

  private

  def link_params
      params.require(:link).permit(:url)
  end

end
