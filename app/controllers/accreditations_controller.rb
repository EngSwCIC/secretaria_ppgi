class AccreditationsController < ApplicationController
  before_action :set_accreditation, only: [:show, :edit, :update, :destroy]

  # GET /accreditations
  # GET /accreditations.json
  def index
    if current_user.role == "administrator"
      @accreditations = Accreditation.all
    else
      @accreditations = Accreditation.where(user_id: current_user.id)
    end
  end

  # GET /accreditations/1
  # GET /accreditations/1.json
  def show
  end

  # GET /accreditations/new
  def new
  end

  # GET /accreditations/1/edit
  def edit
  end

  # POST /accreditations
  # POST /accreditations.json
  def create
  end

  # PATCH/PUT /accreditations/1
  # PATCH/PUT /accreditations/1.json
  def update
    # Atualiza o credenciamento caso exista
    respond_to do |format|
      if @accreditation.update(accreditation_params)
        format.html { redirect_to accreditations_url, notice: 'Credenciamento atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @accreditation }
      else
        format.html { render :edit }
        format.json { render json: @accreditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accreditations/1
  # DELETE /accreditations/1.json
  def destroy
    # Exclui o credenciamento caso exista
    respond_to do |format|
      if @accreditation.destroy
        format.html { redirect_to accreditations_url, notice: 'Credenciamento excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to accreditations_url, notice: 'Erro: não foi possível excluir o credenciamento!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Define parametros de Credenciamento
    def set_accreditation
      @accreditation = Accreditation.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def accreditation_params
      params.require(:accreditation).permit(:user_id, :start_date, :end_date, :sei_proccess_id)
    end
end

