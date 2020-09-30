class CommentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @comment = current_user.comments.build(comment_params)
    @spot = Spot.find(params[:spot_id])
    @comment.spot_id = @spot.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: @spot)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: @spot)
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
