class AccreditationsController < ApplicationController
  before_action :set_accreditation, only: [:show, :edit, :update, :destroy]

  ##
  # Ação index da classe Accreditation.
  # Renderiza a view index, que exibe os credenciamentos criados (dependente do usuário que está logado).
  # GET /accreditations
  def index
    # Lista todas os credenciamentos para um administrador
    if current_user.role == "administrator"
      @accreditations = Accreditation.all
    # Lista os credenciamentos próprios para um professor
    else
      @accreditations = Accreditation.where(user_id: current_user.id)
    end
  end

  ##
  # Ação show da classe Accreditation. Mostra detalhes de um registro criado.
  # GET /accreditations/1
  def show
  end

  ##
  # Ação edit da classe Accreditation. Renderiza página para atualizar um registro.
  # GET /accreditations/1/edit
  def edit
  end

  ##
  # Método responsável por atualizar um registro com os dados inseridos na view edit.
  # Recebe os dados da view edit enviados para o servidor e faz o tratamento dos dados para decidir se a modificação é válida ou não.
  # Redireciona para a view index caso os dados sejam válidos.
  # PATCH/PUT /accreditations/1
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

  ##
  # Método responsável por excluir um registro salvo na tabela.
  # Decide se a exclusão do registro é válida ou não.
  # Redireciona para a view index.
  # DELETE /accreditations/1
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
