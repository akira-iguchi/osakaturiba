class SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
    @comments = @spot.comments.order(id: :desc).page(params[:page]).per(6)
    @comment = current_user.comments.build
  end
  
  def search
    @districts = District.all
    @comments = Comment.all.order(id: :desc).page(params[:page]).per(8)
    if params[:name].present?
      @spots = Spot.where('name LIKE ?', "%#{params[:name]}%")
    else
      @spots = Spot.none
    end
  end
  
  def spot_params
    params.require(:spot).permit(:name, :explanation, :address, :latitude, :longitude)
  end
end
