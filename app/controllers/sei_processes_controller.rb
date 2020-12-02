class SeiProcessesController < ApplicationController
  before_action :set_sei_process, only: [:show, :edit, :update, :destroy]

  # GET /sei_processes
  # Lista os processos e solicitações criados
  def index
    # Filtra solicitações baseadas nos estados marcados como visíveis
    @all_statuses = SeiProcess.all_statuses
    session[:statuses] = params[:statuses] || session[:statuses] || @all_statuses.zip([]).to_h
    @status_filter = session[:statuses].keys
    
    # Lista todas as solicitações de credenciamento para um administrador
    if current_user.role == "administrator"
      @sei_processes = SeiProcess.where(status: @status_filter)
    # Lista as solicitações próprias para um professor
    else
      @my_processes = SeiProcess.where(user_id: current_user.id, status: @status_filter)
    end
  end

  # GET /sei_processes/1
  # Mostra detalhes de um registro criado
  def show
  end

  # GET /sei_processes/new
  # Renderiza página para criação de umm registro
  def new
    # Renderiza Requisitos de Credenciamento, caso existam, na página de criação de processo ou de abrir solicitação de credenciamento
    @requirements = Requirement.find_by(title: 'Requisitos de Credenciamento')
    @sei_process = SeiProcess.new
  end

  # GET /sei_processes/1/edit
  # Renderiza página para atualizar um registro
  def edit
  end

  # POST /sei_processes
  # Faz o tratamento dos dados enviados pelo usuário para decidir se o registro é válido ou não
  def create
    # Faz correções de entradas inválidas baseando-se nos dados do usuário logado
    mandatory_params = {'user_id' => current_user.id, 'status' => 'Espera', 'code' => '0'}
    @sei_process = SeiProcess.new(sei_process_params.merge(mandatory_params))

    respond_to do |format|
      # Mensagem de sucesso ao criar processo ou abrir solicitação quando condições da model forem cumpridas
      if @sei_process.save
        format.html { redirect_to sei_processes_url, notice: 'Processo aberto com sucesso!' }
        format.json { render :index, status: :created, location: @sei_process }
      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :new }
        format.json { render json: @sei_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sei_processes/1
  # Faz o tratamento dos dados modificados pelo usuário para decidir se a modificação é válida ou não
  def update
    respond_to do |format|
      # Mensagem de sucesso ao atualizar processo ou solicitação quando condições da model forem cumpridas
      if @sei_process.update(sei_process_params)
        format.html { redirect_to sei_processes_url, notice: 'Processo atualizado com sucesso!' }
        format.json { render :index, status: :ok, location: @sei_process }

        # Cria o credenciamento correspondente aa solicitação aprovada
        if @sei_process.status == 'Aprovado' && (Accreditation.find_by(sei_process: @sei_process.id) == nil)
          Accreditation.create!(user_id: @sei_process.user_id, sei_process_id: @sei_process.id)
        end

      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :edit }
        format.json { render json: @sei_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sei_processes/1
  # Decide se a exclusão do registro é válida ou não
  def destroy
    respond_to do |format|
      # Mensagem de sucesso ao excluir processo ou solicitação quando condições da model forem cumpridas
      if @sei_process.destroy
        format.html { redirect_to sei_processes_url, notice: 'Processo excluído com sucesso!' }
        format.json { head :no_content }
      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { redirect_to sei_processes_url, notice: 'Erro: não foi possível excluir o processo!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Define parametros de Processo
    def set_sei_process
      @sei_process = SeiProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sei_process_params
      params.require(:sei_process).permit(:user_id, :status, :code, documents: [])
    end
end
