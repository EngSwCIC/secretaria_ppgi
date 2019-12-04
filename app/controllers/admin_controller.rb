class AdminController < ApplicationController
    def index
        @activities = Activitie.all
    end
end