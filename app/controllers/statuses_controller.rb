class StatusesController < ApplicationController
    def index
        @status = Status.All
        render json: @status
    end

    def show
        @status = Status.find(params[:id])
        render json: @status
    end

    def create
        @status = Status.new(status_params)

        if @status.create
            render :json => {message: "novo status criado com sucesso"}
        else
            render :json => {message: "nao foi possivel criar o novo status"}
        end
    end

    def update
        @status = Status.find(params[:id])
        @status = update.(status_params)

        render json: @status
    end

    def delete
        @status = Status.find(params[:id])
        
        if @status.destroy
            render :json => {message: "status excluido com sucesso"}
        else
            render :json => {message: "não foi possivel excluir o status"}
        end
    end

    private

    def status_params
        params.permit(:name)
    end
end
