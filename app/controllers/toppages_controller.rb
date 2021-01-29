class ToppagesController < ApplicationController
  before_action :spot_ranks

  def index
    gon.api_key = ENV['OPEN_WEATHER_MAP_API_KEY']
    @districts = District.all
    @spots = Spot.all
    @comments = if user_signed_in?
                  current_user.feed_comments.order(id: :desc).page(params[:page]).per(6)
                else
                  Comment.all.order(id: :desc).page(params[:page]).per(6)
                end
  end
end
