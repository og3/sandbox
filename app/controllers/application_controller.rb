class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_or_unset_current_user_id_on_cookies
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_or_unset_current_user_id_on_cookies
    cookies.encrypted[:user_id] = (current_user.id if current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
