class RelationshipsController < ApplicationController
  before_action :authenticate_user
  before_action :spot_ranks

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'ユーザーをフォローしました。'
    redirect_back(fallback_location: user)
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザーのフォローを解除しました。'
    redirect_back(fallback_location: user)
  end
end
