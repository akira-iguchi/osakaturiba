class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    @spot = Spot.find(params[:spot_id])
    @comment.spot_id = @spot.id
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: @spot)
    else
      flash.now[:danger] = "コメントできませんでした"
      @comments = @spot.comments.order(id: :desc).page(params[:page]).per(6)
      @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
      render 'spots/show'
    end
  end
  
  def destroy
    @spot = @comment.spot
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: @spot)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :image)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
