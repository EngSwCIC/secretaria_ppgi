class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @activity = Activity.all
        # render json: @activity
        render :index
    end

    def show
        @activity = Activity.find(params[:id])
        # render json: @activity
    end

    def new
        render :new
    end

    def create
        @activity = Activity.create(activity_params) 

        if @activity.save
            # render :json => {message: "Processo criado com êxito"}
            redirect_to action: "show", id: @activity
        else
            render :json => {message: "Não foi possivel criar o Processo", status: 500}
        end
    end

    def update 
        byebug
        @activity = Activity.find(params[:id])
        @activity.update(activity_params)
        redirect_to action: "show", id: @activity

        # render json: @activity
        # render :update
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
        params.permit(:name, :description, :type_activity, :role)
    end
end
