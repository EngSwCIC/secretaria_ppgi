##
# Classe da controller dos tópicos das FAQ
# Herda de ApplicationController
class TopicsController < ApplicationController
  ##
  # Configura as pre-actions de toda requisicao
  # Indica as operacoes disponiveis e trava o acesso para não administradores
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only:  [:create, :edit, :update, :destroy]
  
  ##
  # Retorna todos os topics
  def index
    @topics = Topic.all
  end

 ##
 #...
  def show
  end

 ##
 # Cria nova instancia de topic
  def new
    @topic = Topic.new
  end

 ##
 #...
  def edit
  end

 ##
 # Popula uma instancia de topic com um dos tipos de topic_params
 # Redireciona para a página do topic criado
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Atualiza um topic pre existente
  # Redireciona para a página do topic atualizado
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Apaga uma instancia de topic
  # Redireciona para a página de topics
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

    ##
    # Encontra e seta o topic requerida.
    # @param [number] id - id do topic
    def set_topic
      @topic = Topic.find(params[:id])
    end

    ##
    # Retorna os parametros aceitos pelo topic
    # Podem ser apenas do tipo titulo
    def topic_params
      params.require(:topic).permit(:titulo)
    end

    ##
    # Redireciona o usuário para a pagina faqs
    # caso não seja admin. Exibe alerta na tela.
    def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Rota restrita para administradores"
      end
    end
end
