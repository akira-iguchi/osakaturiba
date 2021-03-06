class SpotsController < ApplicationController
  before_action :spot_ranks

  def show
    @spot = Spot.find(params[:id])
    @comments = @spot.comments.order(id: :desc).page(params[:page]).per(6)
    @comment = current_user.comments.build if user_signed_in?
  end

  def search
    @districts = District.all

    @spots = if params[:name].present?
               Spot.where('name LIKE ?', "%#{params[:name]}%")
             else
               Spot.none
             end

    @district = if params[:name].present?
                  District.where('name LIKE ?', "%#{params[:name]}%")
                else
                  District.none
                end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :explanation, :address, :latitude, :longitude)
  end
end
