class LinksController < ApplicationController

  def show
    @links = current_user.links
  end
end
