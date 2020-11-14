class SessionsController < ApplicationController
  def new
    @login = Session.new
    if logged_in?
      flash[:danger] = 'ログインしています。'
      redirect_to root_url
    end
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    @login = Session.new(email: params[:session][:email].downcase, password: params[:session][:password])
    @login.save
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
