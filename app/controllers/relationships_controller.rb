class RelationshipsController < ApplicationController

  def index
    @users = current_user.followed_users
    @relationship = Relationship.new
  end

  def create
    Relationship.create(followed_user_id: params[:relationship][:user_id], follower: current_user)
    redirect_to '/users'
  end

  def show

    @user = User.find(params[:id])
    @links = @user.links
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to '/relationships'
  end
end
