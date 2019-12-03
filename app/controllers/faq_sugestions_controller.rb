class FaqSugestionsController < ApplicationController
  before_action :set_faq_sugestion, only: [:show, :edit, :update, :destroy]

  # GET /faq_sugestions
  # GET /faq_sugestions.json
  def index
    @faq_sugestions = FaqSugestion.all
  end

  # GET /faq_sugestions/1
  # GET /faq_sugestions/1.json
  def show
  end

  # GET /faq_sugestions/new
  def new
    @faq_sugestion = FaqSugestion.new
  end

  # GET /faq_sugestions/1/edit
  def edit
  end

  # POST /faq_sugestions
  # POST /faq_sugestions.json
  def create
    @faq_sugestion = FaqSugestion.new(faq_sugestion_params)

    respond_to do |format|
      if @faq_sugestion.save
        format.html { redirect_to @faq_sugestion, notice: 'Faq sugestion was successfully created.' }
        format.json { render :show, status: :created, location: @faq_sugestion }
      else
        format.html { render :new }
        format.json { render json: @faq_sugestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faq_sugestions/1
  # PATCH/PUT /faq_sugestions/1.json
  def update
    respond_to do |format|
      if @faq_sugestion.update(faq_sugestion_params)
        format.html { redirect_to @faq_sugestion, notice: 'Faq sugestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq_sugestion }
      else
        format.html { render :edit }
        format.json { render json: @faq_sugestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faq_sugestions/1
  # DELETE /faq_sugestions/1.json
  def destroy
    @faq_sugestion.destroy
    respond_to do |format|
      format.html { redirect_to faq_sugestions_url, notice: 'Faq sugestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_faq_sugestion
      @faq_sugestion = FaqSugestion.find(params[:id])
    end

    def faq_sugestion_params
      params.require(:faq_sugestion).permit(:topico, :pergunta, :resposta, :faq_id)
    end
end
