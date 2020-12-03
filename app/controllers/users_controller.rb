class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[edit update likes]
  before_action :correct_user, only: %i[edit update likes]
  before_action :cannot_guest_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(6)
    @likes = @user.likes
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end

  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end

  def update_params
    params.require(:user).permit(:name, :email, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end

  def require_user_logged_in
    unless logged_in?
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end

  def cannot_guest_user
    if @user.id.to_i == 1
      flash[:danger] = 'ゲストユーザーは編集できません'
      redirect_to @user
    end
  end
end
