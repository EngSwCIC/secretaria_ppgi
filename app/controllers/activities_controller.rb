##
#Essa controller define os métodos de interação de um processo

class ActivitiesController < ApplicationController
    ##
    #A controller de activities possui os métodos index, show, new, edit, create, update, delete e activity_params
    #Eles permitem a criação, exclusão e edição de processos assim como a criação, exclusão e edição de status.

    skip_before_action :verify_authenticity_token

    def index
        @activity = Activity.all
        render :index
    end

    def show
        @activity = Activity.find(params[:id])
    end

    def new
        render :new
    end

    def edit
        @activity = Activity.find(params[:id])
        render :edit
    end

    def create
        @activity = Activity.create(activity_params) 

        if @activity.save
            redirect_to action: "show", id: @activity
        else
            render :json => {message: "Não foi possivel criar o Processo", status: 500}
        end
    end

    def update 
        # byebug
        @activity = Activity.find(params[:id])
        @activity.update(activity_params)
        redirect_to action: "show", id: @activity
    end

    def delete
        @activity = Activity.find(params[:id])
    
        if @activity.destroy
            redirect_to action: "index"
        else
            render :json => {message: "Não foi possivel apagar o Processo"}
        end
    end

    private

    def activity_params
        params.permit(:name, :description, :estado)
    end
end
