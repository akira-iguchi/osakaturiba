class DistrictsController < ApplicationController
  before_action :spot_ranks
  
  def show
    @district = District.find(params[:id])
    @spots = @district.spots
    @comments = Comment.all
  end
end
