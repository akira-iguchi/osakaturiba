class DistrictsController < ApplicationController
  def show
     @district = District.find(params[:id])
     @spots = @district.spots
     @comments = Comment.all
  end
end
