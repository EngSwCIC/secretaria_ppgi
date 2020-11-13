class InformationsController < ApplicationController
  def index
    @informations = Information.all
  end
end
  