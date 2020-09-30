class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    spot = Spot.find(params[:spot_id])
    current_user.favorite(spot)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: @spot)
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    current_user.unfavorite(spot)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: @spot)
  end
end