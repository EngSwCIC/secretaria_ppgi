class HomeController < ApplicationController
    def index
        @activities = Activitie.all
    end
end