# frozen_string_literal: true

module Current
  thread_mattr_accessor :user
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  around_action :set_current_user
  def set_current_user
    Current.user = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name role])
  end
end
