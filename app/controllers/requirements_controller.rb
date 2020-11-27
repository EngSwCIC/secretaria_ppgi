class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    # Lista todos os tipos de requisitos criados
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
    @requirement = Requirement.new(requirement_params)
    
    respond_to do |format|
      # Mensagem de sucesso ao criar requisitos quando condições da model forem cumpridas
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requisitos criados com sucesso!' }
        format.json { render :show, status: :created, location: @requirement }
      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # Exclui documento anexado, caso exista
  def delete_document_attachment
    @document = ActiveStorage::Attachment.find_by(id: params[:id])
    @requirement_id = params[:requirement_id]
    @document&.purge
    redirect_to edit_requirement_path(@requirement_id)
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    respond_to do |format|
      # Mensagem de sucesso ao atualizar requisitos quando condições da model forem cumpridas
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requisitos atualizados com sucesso!' }
        format.json { render :show, status: :ok, location: @requirement }
      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    respond_to do |format|
      # Mensagem de sucesso ao excluir requisitos quando condições da model forem cumpridas
      if @requirement.destroy
        format.html { redirect_to requirements_url, notice: 'Requisitos excluídos com sucesso!' }
        format.json { head :no_content }
      # Mensagem de erro se condições da model não forem cumpridas
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
