class ActivitiesController < ApplicationController

    def index
        # @activity = Activity.All
        # render json: @activity
        render :index
    end

    def show
        @activity = Activity.find(params[:id])
        render json: @activity
    end

    def new
        render :new
    end

    def create
        @activity = Activity.new(activity_params)

        if @activity.save
            # render :json => {message: "Processo criado com êxito"}
            redirect_to "/processos"
        else
            render :json => {message: "Não foi possivel criar o Processo"}
        end
    end

    def update 
        @activity = Activity.find(params[:id])
        @activity = update.(activity_params)

        render json: @activity
    end

    def delete
        @activity = Activity.find(params[:id])
    
        if @activity.destroy
            render :json => {message: "Processo apagado com êxito"}
        else
            render :json => {message: "Não foi possivel apagar o Processo"}
        end
    end

    private

    def activity_params
        params.permit(:name, :description)
    end
end
