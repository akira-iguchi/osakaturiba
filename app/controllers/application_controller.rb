class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to root_path
      flash[:danger] = 'ゲストユーザーのため編集できません。'
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    end
end
