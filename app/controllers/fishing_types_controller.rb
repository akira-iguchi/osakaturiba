class FishingTypesController < ApplicationController
  before_action :spot_ranks

  def index
    @fishing_types = FishingType.all.order(id: :desc).page(params[:page]).per(6)
  end

  private

  def fishing_type_params
    params.require(:fishing_type).permit(:name, :content)
  end
end
