class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follows
    user = User.find(params[:id])
    @user = user.followings
  end

  def followers
    user = User.find(params[:id])
    @user = user.followers
  end
end
