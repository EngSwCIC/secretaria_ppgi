class HomeController < ApplicationController
  before_action :set_word, only: [:index]

  def index
  end

  private
  
  def set_word
    if user_signed_in? && is_admin?(current_user.id)
      @word = "Olá Genaína"
    else
      @word = "Olá impostor"
    end
  end

end
