# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name role])
  end


  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice] = 'Você deve entrar primeiro.'
      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def not_admin(path)
    if current_user.role != 'administrator'
        redirect_to path
    end
  end

end
