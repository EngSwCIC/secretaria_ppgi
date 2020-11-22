class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    # Cria requisitos
    # Se não for possível retorna erro
    # Se for, retorna mensagem de sucesso
    @requirement = Requirement.new(requirement_params)
    
    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requisitos criados com sucesso!' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_document_attachment
    # Exclui documento anexado caso exista
    @document = ActiveStorage::Attachment.find_by(id: params[:id])
    @requirement_id = params[:requirement_id]
    @document&.purge
    redirect_to edit_requirement_path(@requirement_id)
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    # Atualiza requisitos caso exista
    # Se não existir retorna erro
    # Se existir retorna mensagem de sucesso
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requisitos atualizados com sucesso!' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    # Exclui requisitos caso exista
    # Se não existir retorna erro
    # Se existir retorna mensagem de sucesso
    respond_to do |format|
      if @requirement.destroy
        format.html { redirect_to requirements_url, notice: 'Requisitos excluídos com sucesso!' }
        format.json { head :no_content }
      else
        format.html { redirect_to requirements_url, notice: 'Erro: não foi possível excluir os requisitos!' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Define parametros de Requisito
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_params
      params.require(:requirement).permit(:title, :content, documents: [])
    end
end
