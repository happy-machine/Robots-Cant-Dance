class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cache_headers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [:name, :email, :password,
      :password_confirmation, :current_password, :bio, :avatar] 
    )
    devise_parameter_sanitizer.permit(:account_update, keys:
      [:password, :password_confirmation, :current_password, :bio, :avatar] 
    )
  end

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end


end
