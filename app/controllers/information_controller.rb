# This class handles crud operations for informations.
class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # GET /information
  # GET /information.json
  def index
    @information = Information.all
  end

  # GET /information/1
  # GET /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  def operation msg, symbol
    respond_to do |format|
      format.html { redirect_to @information, notice: msg }
      format.json { render :show, status: symbol.to_sym , location: @information }
    end
  end

  def not_operation symbol
    respond_to do |format|
      format.html { render symbol.to_sym }
      format.json { render json: @information.errors, status: :unprocessable_entity }
    end
  end
  # POST /information
  # POST /information.json
  def create    
      @information = Information.new information_params
      @information.save ? operation("Informação foi criada com sucesso.", "created") : not_operation("new")
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    @information.update(information_params) ? operation("Informação foi atualizada com sucesso.", "ok") : not_operation("edit")
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Informação foi destruída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:title, :info, :fonte)
    end
end
