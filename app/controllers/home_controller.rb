class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @activities = Activitie.all
    end
end