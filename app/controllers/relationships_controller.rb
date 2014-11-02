class RelationshipsController < ApplicationController

  def index
    @users = current_user.followed_users.uniq
    @relationship = Relationship.new
  end

  def create
    Relationship.create(followed_user_id: params[:relationship][:user_id], follower: current_user)
    redirect_to '/relationships'
  end

  def delete
    binding.pry
  end
end
