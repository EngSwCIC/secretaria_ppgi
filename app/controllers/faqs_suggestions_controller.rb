class FaqsSuggestionsController < ApplicationController
  before_action :set_faqs_suggestion, only: [:show, :edit, :update, :destroy]
  #before_action :must_be_authenticated_user, only:  [:create, :edit, :update]

  # GET /faqs_suggestions
  # GET /faqs_suggestions.json
  def index
    @faqs_suggestions = FaqsSuggestion.all
  end

  # GET /faqs_suggestions/1
  # GET /faqs_suggestions/1.json
  def show
  end

  # GET /faqs_suggestions/new
  def new
    @faqs_suggestion = FaqsSuggestion.new
  end

  # GET /faqs_suggestions/1/edit
  def edit
  end

  # POST /faqs_suggestions
  # POST /faqs_suggestions.json
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

  # PATCH/PUT /faqs_suggestions/1
  # PATCH/PUT /faqs_suggestions/1.json
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

  # DELETE /faqs_suggestions/1
  # DELETE /faqs_suggestions/1.json
  def destroy
    @faqs_suggestion.destroy
    respond_to do |format|
      format.html { redirect_to faqs_suggestions_url, notice: 'Faqs suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faqs_suggestion
      @faqs_suggestion = FaqsSuggestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faqs_suggestion_params
      params.require(:faqs_suggestion).permit(:question, :answer, :tropicQuestion_id)
    end
end
