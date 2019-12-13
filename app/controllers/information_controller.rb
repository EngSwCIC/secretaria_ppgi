##
# = Classe responsavel pelas infomaçoes do sistema.
# Nessa controller estao todas as operaçoes de criaçao, deleçao e atualizaçao das informaçoes.
# Operaçoes CRUD
class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # Metodo responsavel por exibir todas as infomaçoes cadastradas.
  #
  # GET /information
  # GET /information.json
  def index
    @information = Information.all
  end

  # Metodo responsavel por exibir todas as fontes de infomaçoes cadastradas.
  #
  # GET /information/1
  # GET /information/1.json
  def show
  end

  # Metodo responsavel por receber os dados do formulario e armazenar na variavel e passar para o metodo create.
  #
  # GET /information/new
  def new
    @information = Information.new
  end

  # Metodo responsavel por chamar o formulario de ediçao.
  #
  # GET /information/1/edit
  def edit
  end

  def operation msg, symbol #:nodoc:
    respond_to do |format|
      format.html { redirect_to @information, notice: msg }
      format.json { render :show, status: symbol.to_sym , location: @information }
    end
  end

  def not_operation symbol #:nodoc:
    respond_to do |format|
      format.html { render symbol.to_sym }
      format.json { render json: @information.errors, status: :unprocessable_entity }
    end
  end

  # Metodo responsavel por criar uma nova informaçao.
  #
  # POST /information
  # POST /information.json
  def create    
      @information = Information.new information_params
      @information.save ? operation("Informação foi criada com sucesso.", "created") : not_operation("new")
  end

  # Metodo responsavel por atualizar uma informaçao.
  #
  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    @information.update(information_params) ? operation("Informação foi atualizada com sucesso.", "ok") : not_operation("edit")
  end

  # Metodo responsavel por deletar/destruir uma fonte de informaçao.
  #
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
