class FriendshipsController < ApplicationController

  def create
    user = User.find(params[:friend_id])
    Friendship.create(user_id: params[:user_id],
                      friend_id: params[:friend_id])
    redirect_to tweets_path(user.handle)
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to tweets_path(friendship.friend.handle)
  end
end