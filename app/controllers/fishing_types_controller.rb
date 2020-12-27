class FishingTypesController < ApplicationController

  def index
    @fishing_types = FishingType.all
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end

  private

  def fishing_type_params
    params.require(:fishing_type).permit(:name, :content)
  end
end
