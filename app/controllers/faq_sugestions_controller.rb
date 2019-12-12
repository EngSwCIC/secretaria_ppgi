##
# Essa classe é a controller para as sugestões do FAQ, contendo métodos que as manipulam.

class FaqSugestionsController < ApplicationController
  before_action :set_faq_sugestion, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only:  [:destroy, :index, :accept]
  before_action :must_be_authenticated_user, only:  [:create, :edit, :update]

  ##
  # Lista todos os objetos da classe.

  def index
    @faq_sugestions = FaqSugestion.all
  end

  def show #:nodoc:
  end

  ##
  # Cria um novo objeto da classe.
  #
  # Esse método inicializa os campos "pergunta", "topico" e "faq_id" com os mesmos campos do FAQ associado à ele, se houver.
  # Isso é feito para diferenciar a sugestão de uma nova pergunta do zero e uma resposta para um pergunta já existente, dando a essa última os atributos de seu FAQ associado.

  def new
    @faq_sugestion = FaqSugestion.new
    @faq_sugestion.pergunta = params[:pergunta]
    @faq_sugestion.topico = params[:topico]
    @faq_sugestion.faq_id = params[:faq_id]
  end

  def edit #:nodoc:
  end

  ##
  # Cria e salva uma nova sugestão no banco de dados.

  def create
    @faq_sugestion = FaqSugestion.new(faq_sugestion_params)

    respond_to do |format|
      # Salvamento foi bem sucessido, com mensagem de sucesso sendo mostrada.
      if @faq_sugestion.save
        format.html { redirect_to @faq_sugestion, notice: 'Faq sugestion was successfully created.' }
        format.json { render :show, status: :created, location: @faq_sugestion }
      # Salvamento mal sucessido, com mensagem de erro sendo mostrada.
      else
        format.html { render :new }
        format.json { render json: @faq_sugestion.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Atualiza uma sugestão.
  #
  # Esse método varia os parâmetros permitidos se há um FAQ associado (somente "resposta" permitido) ou se não há ("topico", "faq_id", "pergunta" e "resposta" permitidos).
  
  def update
    if @faq_sugestion.faq_id == nil
      # Parâmetros para o update quando não tem um FAQ associado.
      params = faq_sugestion_params
    else
      # Parâmetros para o update quando tem um FAQ associado.
      params = faq_sugestion_update_params
    end
    respond_to do |format|
      # Atualização foi bem sucessids, com mensagem de sucesso sendo mostrada.
      if @faq_sugestion.update(params)
        format.html { redirect_to @faq_sugestion, notice: 'Faq sugestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq_sugestion }
      # Atualização mal sucessida, com mensagem de erro sendo mostrada.
      else
        format.html { render :edit }
        format.json { render json: @faq_sugestion.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Deleta uma sugestão do banco de dados.

  def destroy
    @faq_sugestion.destroy
    respond_to do |format|
      format.html { redirect_to faq_sugestions_url, notice: 'Faq sugestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ##
  # Aceita uma sugestão, mandando-a para o banco de dados do FAQ.
  #
  # Caso a sugestão não esteja associada à um FAQ, é criado uma nova entrada no banco de dados do FAQ, caso contrário, o FAQ associado é atualizado.

  def accept
    sugestion = FaqSugestion.find(params[:id])
    # Sugestão não associada a um FAQ.
    if sugestion.faq_id == nil
      # Novo FAQ é criado com os campos da sugestão.
      new_faq = Faq.create(:topico => sugestion.topico, :pergunta => sugestion.pergunta, :resposta => sugestion.resposta)
    else
      # FAQ associado é encontrada e atualizado com a nova resposta.
      faq_update = Faq.find(sugestion.faq_id)
      faq_update.resposta = sugestion.resposta
      faq_update.update(update_faq_params)
    end
    
    # Sugestão é excluida e mensgaem de sucesso é mostrada.
    sugestion.destroy
    respond_to do |format|
      format.html { redirect_to faq_sugestions_url, notice: 'Faq sugestion was successfully accepted.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_faq_sugestion
      @faq_sugestion = FaqSugestion.find(params[:id])
    end

    ##
    # Parâmetros permitidos para criar uma sugestão ou atualizar sem um FAQ associado.

    def faq_sugestion_params
      params.require(:faq_sugestion).permit(:topico, :pergunta, :resposta, :faq_id)
    end

    ##
    # Parâmetros permitdos para atualizar uma sugestão com um FAQ associado.

    def faq_sugestion_update_params
      params.require(:faq_sugestion).permit(:resposta)
    end

    ##
    # Parâmetros permitdos para atualizar um FAQ.

    def update_faq_params
      params.permit(:topico, :pergunta, :resposta)
    end

    ##
    # Verifica se o usuário logado é um admin, alertando caso não for.

    def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Essa função é restrita a administradores"
      end
    end

    ##
    # Verifica se o usuário está logado e não é um admin, alertando caso não essas condições não sejam cumpridas.

    def must_be_authenticated_user
      unless current_user && current_user.role != "administrator"
        redirect_to faqs_url, alert: "Essa função é restrita a usuários cadastrados e logged-in não administradores"
      end
    end
end
