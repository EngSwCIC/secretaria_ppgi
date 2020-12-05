# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  extend ActiveSupport::Concern
  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :bad_request, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name role])
  end


end
