class FishingTypesController < ApplicationController
  before_action :spot_ranks
  # before_action :correct_user, only: %i[edit update destroy]

  def index
    @fishing_types = FishingType.all
  end

  # 実装思考中
  # def new 
  #   @fishing_type = FishingType.new
  # end

  # def create
  #   @fishing_type = FishingType.new(fishing_type_params)
  #   if @fishing_type.save 
  #     flash[:success] = '釣り方を投稿しました。'
  #     redirect_to fishing_types_path
  #   else
  #     flash.now[:danger] = '釣り方を投稿できませんでした。'
  #     render :new
  #   end
  # end

  # def destroy
  #   @fishing_type = FishingType.find(params[:id])
  #   @fishing_type.destroy
  #   flash[:success] = '釣り方を削除しました。'
  #   redirect_to fishing_types_path
  # end

  private

  def fishing_type_params
    params.require(:fishing_type).permit(:name, :content)
  end

  # def correct_user
  #   @fishing_type = current_user.fishing_types.find_by(id: params[:id])
  #   redirect_to root_url unless @fishing_type
  # end
end
