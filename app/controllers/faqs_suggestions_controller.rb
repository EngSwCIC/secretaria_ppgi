##
# Classe da controller das sugestões de resposta ou pergunta das FAQ
# Herda de ApplicationController
class FaqsSuggestionsController < ApplicationController
  before_action :set_faqs_suggestion, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only:  [:destroy, :index, :accept]
  before_action :must_be_authenticated_user, only:  [:create, :edit, :update]
 
  ##
  # Retorna todas as faqs_suggestions
  def index
    @faqs_suggestions = FaqsSuggestion.all
  end

  ##
  #...
  def show
  end

  ##
  # Cria nova instancia de faqs_suggestion
  def new
    @faqs_suggestion = FaqsSuggestion.new
  end

  ##
  #...
  def edit
  end


  ##
  # Popula uma instancia de faqs_suggestions com um dos tipos de faqs_suggestion_params
  # Redireciona para a página da faqs_suggestions criada.
  def create
    @faqs_suggestion = FaqsSuggestion.new(faqs_suggestion_params)

    respond_to do |format|
      if @faqs_suggestion.save
        format.html { redirect_to @faqs_suggestion, notice: 'Faqs suggestion was successfully created.' }
        format.json { render :show, status: :created, location: @faqs_suggestion }
      else
        format.html { render :new }
        format.json { render json: @faqs_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

 ##
 # Atualiza uma faqs_suggestions pre existente
 # Redireciona para a página da faqs_suggestions atualizada
  def update
    respond_to do |format|
      if @faqs_suggestion.update(faqs_suggestion_params)
        format.html { redirect_to @faqs_suggestion, notice: 'Faqs suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @faqs_suggestion }
      else
        format.html { render :edit }
        format.json { render json: @faqs_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Apaga uma instancia de faqs_suggestion
  # Redireciona para a página faqs_suggestions
  def destroy
    @faqs_suggestion.destroy
    respond_to do |format|
      format.html { redirect_to faqs_suggestions_url, notice: 'Faqs suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    
    ##
    # Econtra e seta a faqs_suggestion requerida
    # @param [number] id - id da faqs_suggestion
    def set_faqs_suggestion
      @faqs_suggestion = FaqsSuggestion.find(params[:id])
    end

    ##
    # Retorna os parametros aceitos pelos métodos de faq_suggestion
    # Podem ser do tipo Question, Answer ou Topic_id
    def faqs_suggestion_params
      params.require(:faqs_suggestion).permit(:question, :answer, :topic_id)
    end

    ##
    # Redireciona o usuário para a pagina faqs
    # caso não seja admin. Exibe alerta na tela
    def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Rota restrita para administradores"
      end
    end

    ##
    # Redireciona o usuário para a página faqs
    # caso nao seja um usuario autenticado.
     def must_be_authenticated_user
      unless current_user && current_user.role != "administrator"
        redirect_to faqs_url, alert: "Rota restrita para usuários cadastrados"
      end
    end
end
