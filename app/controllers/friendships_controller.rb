class FriendshipsController < ApplicationController
  def create
    current_user.active_friendships.create(followed_id: params[:user_id])
    redirect_to users_path
  end

  def destroy
    current_user.active_friendships.find_by(followed_id: params[:user_id]).destroy
    redirect_to users_path
  end
end
