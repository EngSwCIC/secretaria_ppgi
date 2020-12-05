##
# Classe da controller dos FAQS
# Herda de +ApplicationController+
class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only:  [:create, :edit, :update, :destroy]
  

  ##
  # Retorna todos as FAQ
  def index
    @faqs = Faq.all
  end

  ##
  #...
  def show
  end

 ##
 # Cria nova instancia de FAQ
  def new
    @faq = Faq.new
  end

  ##
  #...
  def edit
  end

 ##
 # Popula uma instancia de FAQ com um dos tipos do faq_params
 # Redireciona para a página da FAQ criada.
  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'Faq was successfully created.' }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  
  ##
  # Atualiza uma FAQ pre existente
  # Redireciona para a página da FAQ atualizada
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to @faq, notice: 'Faq was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

 
  ##
  # Apaga uma instancia de FAQ
  # Redireciona para faqs_url
  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: 'Faq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
   
    ##
    # Encontra e seta a FAQ requerida.
    # @param [number] id - id da FAQ
    def set_faq
      @faq = Faq.find(params[:id])
    end

   ##
   # Retorna os parametros aceitos pela FAQ
   # Podem ser do tipo Question, Answer ou Topic_id
    def faq_params
      params.require(:faq).permit(:question, :answer, :topic_id)
    end

    ##
    # Redireciona o usuário para a pagina faqs_url
    # caso não seja admin. Exibe alertaa na tela.
     def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Rota restrita para administradores"
      end
    end

end
