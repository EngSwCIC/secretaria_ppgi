class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # Lista os requisitos criados
  def index
    # Lista todos os tipos de requisitos criados
    @requirements = Requirement.all
  end

  # GET /requirements/1
  # Mostra detalhes de um registro criado
  def show
  end

  # GET /requirements/new
  # Renderiza página para criação de umm registro
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  # Renderiza página para atualizar um registro
  def edit
  end

  # POST /requirements
  # Faz o tratamento dos dados enviados pelo usuário para decidir se o registro é válido ou não
  def create
    @requirement = Requirement.new(requirement_params)
    
    respond_to do |format|
      # Quando condições da model forem cumpridas, cria um novo registro no banco, redireciona para pagina index da entidade atual e mostra uma mensagem de sucesso 
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requisitos criados com sucesso!' }
      # Mostra uma mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :new }
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
  # Faz o tratamento dos dados modificados pelo usuário para decidir se a modificação é válida ou não
  def update
    respond_to do |format|
      # Quando condições da model forem cumpridas, atualiza o registro no banco, redireciona para pagina de detalhes do registro recém modificado e mostra uma mensagem de sucesso 
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: 'Requisitos atualizados com sucesso!' }
      # Mostra uma mensagem de erro se condições da model não forem cumpridas
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /requirements/1
  # Decide se a exclusão do registro é válida ou não
  def destroy
    respond_to do |format|
      # Mensagem de sucesso ao excluir requisitos quando condições da model forem cumpridas
      if @requirement.destroy
        format.html { redirect_to requirements_url, notice: 'Requisitos excluídos com sucesso!' }
      # Mensagem de erro se condições da model não forem cumpridas
      else
        format.html { redirect_to requirements_url, notice: 'Erro: não foi possível excluir os requisitos!' }
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
