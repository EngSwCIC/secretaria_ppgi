class AccreditationsController < ApplicationController
  before_action :set_accreditation, only: [:show, :edit, :update, :destroy]

  # GET /accreditations
  # Lista os credenciamentos criados
  def index
    # Lista todas os credenciamentos para um administrador
    if current_user.role == "administrator"
      @accreditations = Accreditation.all
    # Lista os credenciamentos próprios para um professor
    else
      @accreditations = Accreditation.where(user_id: current_user.id)
    end
  end

  # GET /accreditations/1
  # Mostra detalhes de um registro criado
  def show
  end

  # GET /accreditations/1/edit
  # Renderiza página para atualizar um registro
  def edit
  end

  # PATCH/PUT /accreditations/1
  # Faz o tratamento dos dados modificados pelo usuário para decidir se a modificação é válida ou não
  def update
    respond_to do |format|
      # Quando condições da model forem cumpridas, atualiza o registro no banco, redireciona para pagina index da tabela atual e mostra uma mensagem de sucesso 
      if @accreditation.update(accreditation_params)
        format.html { redirect_to accreditations_url, notice: 'Credenciamento atualizado com sucesso!' }
      # Mostra uma mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /accreditations/1
  # Decide se a exclusão do registro é válida ou não
  def destroy
    respond_to do |format|
      # Mensagem de sucesso ao excluir o credenciamento quando condições da model forem cumpridas
      if @accreditation.destroy
        format.html { redirect_to accreditations_url, notice: 'Credenciamento excluído com sucesso!' }
      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { redirect_to accreditations_url, notice: 'Erro: não foi possível excluir o credenciamento!' }
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

