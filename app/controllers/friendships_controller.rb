class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend successfully!"
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by_friend_id(params[:id])
    if @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to root_url
    else
      flash[:error] = "Unable to remove friend."
      redirect_to root_url
    end
  end

end
