class DistrictsController < ApplicationController

  def show
     @district = District.find(params[:id])
     @spots = @district.spots
     @comments = Comment.all
     @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end
end
