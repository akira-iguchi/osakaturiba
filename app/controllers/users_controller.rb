class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[likes followers]
  before_action :correct_user, only: [:likes]
  before_action :spot_ranks

  def show
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(6)
    @likes = @user.likes
    counts(@user)
  end

  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(6)
    @likes = @user.likes
    counts(@user)
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
