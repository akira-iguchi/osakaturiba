class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :spot_ranks

  def index
    @records = Record.all
    @record = Record.new
  end

  def show
    @record = Record.find(params[:id])
    @user = current_user
  end

  def create
    @records = Record.all
    @record = current_user.records.build(record_params)
    @record.user_id = current_user.id
    if @record.save
      flash[:success] = '釣りの記録をしました。'
      redirect_to user_records_path
    else
      flash.now[:danger] = '釣りの記録ができませんでした。'
      render 'records/index'
    end
  end

  def edit
    @records = Record.all
    @record = Record.find(params[:id])
  end

  def update

  end

  def destroy
    @user = current_user
    @record.destroy
    flash[:success] = '釣りの記録を削除しました。'
    redirect_to user_records_path
  end

  private

  def record_params
    params.require(:record).permit(:fishingtype, :spot, :bait, :start_time)
  end

  def correct_user
    # redirect_to root_url unless @record.user_id = current_user.id
  end
end
