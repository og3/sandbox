class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user_id_on_cookies

  private
  def set_current_user_id_on_cookies
    cookies.encrypted[:user_id] ||= current_user.id
  end
end
