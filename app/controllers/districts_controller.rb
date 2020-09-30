class DistrictsController < ApplicationController
  def show
     @district = District.find(params[:id])
     @spot = Spot.find(params[:id])
     @spots = @district.spots
     @comments = Comment.all.order(id: :desc).page(params[:page]).per(8)
  end
end
