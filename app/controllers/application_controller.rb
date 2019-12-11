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
    if (user_signed_in? == false) or (current_user.role != 'administrator')
      redirect_to path
    end
  end

  def add_value(value)
    if current_user.role == 'administrator'
      value ||= 0
      if (Budget.first.value + value) < 0
        mensagem =  "Orçamento insuficiente para realizar essa operação."
        return [false, mensagem]

      else
        Budget.first.update_attribute( :value, Budget.first.value + value)
        return [true, nil]
      end
    end
  end

  def update_with_params(db, db_params, msg)
    respond_to do |format|
      if db.update(db_params)
        format.html { redirect_to db, notice:  msg}
      else
        format.html { render :edit }
      end
    end
  end

  def create_confirm(db, msg, path)
    respond_to do |format|
      if db.save
        format.html { redirect_to path, notice: msg }
      else
        format.html { render :new }
      end
    end
  end
end
