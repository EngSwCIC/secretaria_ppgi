class SeiProcessesController < ApplicationController
  before_action :set_sei_process, only: [:show, :edit, :update, :destroy]

  # GET /sei_processes
  # GET /sei_processes.json
  def index
    @all_statuses = %w[Espera Aprovado Rejeitado]

    session[:statuses] = params[:statuses] || session[:statuses] || @all_statuses.zip([]).to_h
    @status_filter = session[:statuses].keys

    if current_user.role == "administrator"
      @sei_processes = SeiProcess.where(status: @status_filter)
    else
      @my_processes = SeiProcess.where(user_id: current_user.id, status: @status_filter)
    end
  end

  # GET /sei_processes/1
  # GET /sei_processes/1.json
  def show
  end

  # GET /sei_processes/new
  def new
    @requirements = Requirement.find_by(title: 'Requisitos de Credenciamento')
    @sei_process = SeiProcess.new
  end

  # GET /sei_processes/1/edit
  def edit
  end

  # POST /sei_processes
  # POST /sei_processes.json
  def create
    mandatory_params = {'user_id' => current_user.id, 'status' => 'Espera', 'code' => '0'}
    @sei_process = SeiProcess.new(sei_process_params.merge!(mandatory_params))

    respond_to do |format|
      if @sei_process.save
        format.html { redirect_to sei_processes_url, notice: 'Processo aberto com sucesso!' }
        format.json { render :index, status: :created, location: @sei_process }
      else
        format.html { render :new }
        format.json { render json: @sei_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sei_processes/1
  # PATCH/PUT /sei_processes/1.json
  def update
    respond_to do |format|
      if @sei_process.update(sei_process_params)
        format.html { redirect_to sei_processes_url, notice: 'Processo atualizado com sucesso!' }
        format.json { render :index, status: :ok, location: @sei_process }

        if (@sei_process.status == 'Aprovado') && @sei_process.documents.attached?
          accreditation_instance = Accreditation.find_by(sei_process: @sei_process.id)
          if accreditation_instance == nil
            Accreditation.create!(user_id: @sei_process.user_id, sei_process_id: @sei_process.id)
          end
        end

      else
        format.html { render :edit }
        format.json { render json: @sei_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sei_processes/1
  # DELETE /sei_processes/1.json
  def destroy
    respond_to do |format|
      if @sei_process.destroy
        format.html { redirect_to sei_processes_url, notice: 'Processo excluído com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to sei_processes_url, notice: 'Erro: não foi possível excluir o processo!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sei_process
      @sei_process = SeiProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sei_process_params
      params.require(:sei_process).permit(:user_id, :status, :code, documents: [])
    end
end
