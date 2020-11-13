class ActivitiesController < ApplicationController
    def index
        @activities = Activity.all
    end

    def new
    end

    def create
        @activity = Activity.new(activity_params)
        if @activity.save
            flash[:notice] = "Atividade cadastrada com sucesso."
            redirect_to activities_path
        elsif @activity.errors.any?
            flash[:notice] = ["Atividade não cadastrada."]
            @activity.errors.each do |attribute, message|
                flash[:notice] << message
            end
            redirect_back(fallback_location: new_activity_path)
        end
    end

    private
        def activity_params
            params.fetch(:activity, {}).permit(:title, :due_date)
        end
end