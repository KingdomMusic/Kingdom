class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_characters, :first_name_characters, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end

  def after_sign_in_path_for(resource)
      user_path(current_user)
  end

  def after_sign_up_path_for(resource)
      user_path(current_user)
  end

end
