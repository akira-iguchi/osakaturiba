# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    if user_signed_in?
      flash.now[:danger] = 'すでにログインしています。'
    end
    super
  end

  # POST /resource/sign_in
  def create
    if user_signed_in?
      flash[:success] = 'ログインしました。'
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが違います。'
    end
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
    flash[:success] = 'ログアウトしました。'
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path
    flash[:success] = 'ゲストユーザーとしてログインしました。'
  end
end
