class ApplicationController < ActionController::Base
  default_form_builder BulmaFormBuilder
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user?(user)
    current_user.id == user.id
  end
  helper_method :current_user?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :location, :bio, :art, :available, :avatar])  
end
end
