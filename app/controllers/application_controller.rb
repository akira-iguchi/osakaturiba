class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to root_path
      flash[:danger] = 'ゲストユーザーのため編集できません。'
    end
  end

  def authenticate_user
    unless user_signed_in? 
      redirect_to root_path
      flash[:danger] = '新規登録またはログインしてください。'
    end
  end
  
  private

  def spot_ranks
    @all_ranks = Spot.find(Favorite.group(:spot_id).order('count(spot_id) desc').limit(3).pluck(:spot_id))
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    end
end
