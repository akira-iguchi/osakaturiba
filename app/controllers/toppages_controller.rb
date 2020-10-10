class ToppagesController < ApplicationController
before_action :require_user_logged_in, only: [:login_top]  
  
  def login_top
    @districts = District.all
    @spots = Spot.all
    @comments = Comment.all.order(id: :desc).page(params[:page]).per(6)
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end
  
  def logout_top
    if logged_in?
      redirect_to controller: :toppages, action: :login_top
    end
  end
end
