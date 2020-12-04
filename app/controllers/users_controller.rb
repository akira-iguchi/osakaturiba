class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:likes]
  before_action :correct_user, only: [:likes]

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(6)
    @likes = @user.likes
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end

  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
