class GuestSessionsController < ApplicationController
  def create
    session[:user_id] = 1
    flash[:success] = 'ゲストユーザーでログインしました。'
    redirect_to root_url
  end
end
