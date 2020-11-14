class FavoritesController < ApplicationController
before_action :require_user_logged_in

  def create
    spot = Spot.find(params[:spot_id])
    current_user.favorite(spot)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to spot
  end

  def destroy
    page = params[:page_id]
    spot = Spot.find(params[:spot_id])
    current_user.unfavorite(spot)
    flash[:success] = 'お気に入り登録を解除しました。'
    if page.to_i == 3
      redirect_to current_user
    elsif page.to_i == 4
      redirect_to spot
    end
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end