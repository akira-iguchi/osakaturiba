class RelationshipsController < ApplicationController
  before_action :authenticate_user
  before_action :spot_ranks

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = "#{user.name}さんをフォローしました。"
    redirect_back(fallback_location: user)
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = "#{user.name}さんのフォローを解除しました。"
    redirect_back(fallback_location: user)
  end
end
