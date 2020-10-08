class ToppagesController < ApplicationController
  def index
    @districts = District.all
    @spots = Spot.all
    @comments = Comment.all.order(id: :desc).page(params[:page]).per(6)
  end
end
