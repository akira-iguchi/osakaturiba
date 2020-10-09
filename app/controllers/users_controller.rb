class UsersController < ApplicationController
before_action :require_user_logged_in, only: [:show, :edit, :update ,:likes]
before_action :correct_user, only: [:edit, :update, :likes]
  
  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(6)
    @likes = @user.likes
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end
  
  def update
  @user = User.find(params[:id])
  
   if current_user == @user
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end   
   else
      redirect_to root_url
   end
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
  def update_params
   params.require(:user).permit(:name, :email, :image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_url
    end
  end
end
