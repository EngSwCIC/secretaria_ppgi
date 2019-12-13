##
#:nodoc:

class ApplicationController < ActionController::Base #:nodoc:
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name role])
  end
end
