class TagsController < ApplicationController
  include TagsHelper
  def index
    @tags = fetch_tags(10,current_user.id)
    # @tags = current_user.tags
  end

  def search
    tag_array = fetch_tags(10,current_user.id,params["currentString"])
    render(:partial => "tag_container", :locals => {:tags => tag_array})
  end

end
