class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only:  [:create, :edit, :update, :destroy]
  
  def index
    @faqs = Faq.all
  end

  
  def show
  end

 
  def new
    @faq = Faq.new
  end

  
  def edit
  end

 
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

   
    def faq_params
      params.require(:faq).permit(:question, :answer, :topic_id)
    end

     def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Rota restrita para administradores"
      end
    end

end
