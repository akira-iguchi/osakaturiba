class ToppagesController < ApplicationController
  def index
    @districts = District.all
    @spots = Spot.all
    @comments = Comment.all.order(id: :desc).page(params[:page]).per(6)
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end
end
