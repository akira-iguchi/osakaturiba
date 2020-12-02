class SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
    @comments = @spot.comments.order(id: :desc).page(params[:page]).per(6)
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
    @comment = current_user.comments.build if logged_in?
  end

  def search
    gon.api_key = ENV['OPEN_WEATHER_MAP_API_KEY']
    @districts = District.all
    @comments = Comment.all.order(id: :desc).page(params[:page]).per(6)
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
    @spots = if params[:name].present?
               Spot.where('name LIKE ?', "%#{params[:name]}%")
             else
               Spot.none
             end
  end

  def spot_params
    params.require(:spot).permit(:name, :explanation, :address, :latitude, :longitude)
  end
end
