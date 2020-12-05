class FaqsSuggestionsController < ApplicationController
  before_action :set_faqs_suggestion, only: [:show, :edit, :update, :destroy]
  before_action :must_be_admin, only:  [:destroy, :index, :accept]
  before_action :must_be_authenticated_user, only:  [:create, :edit, :update]
 
  def index
    @faqs_suggestions = FaqsSuggestion.all
  end

  
  def show
  end

  
  def new
    @faqs_suggestion = FaqsSuggestion.new
  end

  def edit
  end

  
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

  def destroy
    @faqs_suggestion.destroy
    respond_to do |format|
      format.html { redirect_to faqs_suggestions_url, notice: 'Faqs suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_faqs_suggestion
      @faqs_suggestion = FaqsSuggestion.find(params[:id])
    end

   
    def faqs_suggestion_params
      params.require(:faqs_suggestion).permit(:question, :answer, :topic_id)
    end

    def must_be_admin
      unless current_user && current_user.role == "administrator"
        redirect_to faqs_url, alert: "Rota restrita para administradores"
      end
    end

     def must_be_authenticated_user
      unless current_user && current_user.role != "administrator"
        redirect_to faqs_url, alert: "Rota restrita para usuários cadastrados"
      end
    end
end
