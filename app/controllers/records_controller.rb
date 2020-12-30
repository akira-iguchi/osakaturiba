class RecordsController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user, only: %i[show create edit update destroy]
  before_action :spot_ranks

  def index
    unless user_records_path(current_user) == url_for(controller: "records", action: "index", only_path: true)
      redirect_to user_records_path(current_user)
    end
    @records = current_user.records
    @record = current_user.records.build
  end

  def show
    @record = Record.find(params[:id])
    @user = current_user
  end

  def create
    @records = current_user.records
    @record = current_user.records.build(record_params)
    @record.user_id = current_user.id
    if @record.save
      flash[:success] = 'フィッシング記録を作成しました。'
      redirect_to user_records_path
    else
      flash.now[:danger] = 'フィッシング記録が作成できませんでした。'
      render 'records/index'
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:success] = 'フィッシング記録を変更しました。'
      redirect_to user_record_path
    else
      flash.now[:danger] = 'フィッシング記録の変更ができませんでした。'
      render 'records/edit'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @user = current_user
    @record.destroy
    flash[:success] = 'フィッシング記録を削除しました。'
    redirect_to user_records_path
  end

  private

  def record_params
    params.require(:record).permit(:fishingtype, :spot, :bait, :weather, :fishing_start_time, :fishing_end_time, :detail, :start_time)
  end

  def correct_user
    @record = current_user.records.build
    redirect_to root_url unless @record.user_id = current_user.id
  end
end
