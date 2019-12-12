##
# Essa classe é a controller para as entradas do FAQ, contendo métodos que as manipulam.

class FaqsController < ApplicationController
    before_action :set_faq, only: [:show, :edit, :update, :destroy]
    before_action :must_be_admin, only:  [:create, :edit, :update, :destroy]
    
  ##
  # Lista todos os objetos da classe.
    
  def index
    @faqs = Faq.all
  end
  
  def show #:nodoc:
  end
  
  ##
  # Cria um novo objeto da classe.

  def new
    @faq = Faq.new
  end
  
  def edit #:nodoc:
  end
  
  ##
  # Cria e salva uma nova entrada do FAQ no banco de dados.
  
  def create
    @faq = Faq.new(faq_params)
  
    respond_to do |format|
      # Salvamento foi bem sucessido, com mensagem de sucesso sendo mostrada.
      if @faq.save
        format.html { redirect_to @faq, notice: 'Faq was successfully created.' }
        format.json { render :show, status: :created, location: @faq }
      # Salvamento foi mal sucessido, com mensagem de erro sendo mostrada.
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end
  
  ##
  # Atualiza uma entrada do FAQ.

  def update
    respond_to do |format|
      # Atualização foi bem sucessida, com mensagem de sucesso sendo mostrada.
      if @faq.update(faq_params)
        format.html { redirect_to @faq, notice: 'Faq was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq }
      # Atualização foi bem sucessida, com mensagem de erro sendo mostrada.
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end
  
  ##
  # Deleta uma entrada do banco de dados.

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: 'Faq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
    def set_faq
      @faq = Faq.find(params[:id])
    end
  
    ##
    # Parâmetros permitidos para criar ou atualizar uma entrada do FAQ.

    def faq_params
      params.require(:faq).permit(:topico, :pergunta, :resposta)
    end

    ##
    # Verifica se o usuário logado é um admin, alertando caso não for.

    def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Not admin"
      end
    end

end
  