# frozen_string_literal: true

# A Classe BudgetsController eh responsavel por hospedar os metodos da pagina de orçamento
class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]
  before_action { not_admin(root_path) }
  #before_action except: [:index] do
  #  redirect_to(budgets_path)
  #end

  def initialize
    super
    @budget = budget
  end

  # GET /budgets
  # GET /budgets.json
  # O metodo index eh responsavel por criar as variaveis da index
  def index
    # @b = Budget.all
    @budget = Budget.first
    @value = @budget.value
    @logs = @budget.logs
  end

=begin

  # GET /budgets/1
  # GET /budgets/1.json
  # O metodo index eh responsavel por mostrar o orçamento porem nao eh usado no programa
  def show; end

  # GET /budgets/new
  # O metodo new eh responsavel por permitir a criaçao de um novo orçamento, porem nao eh usado no programa
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  # O metodo edit eh responsavel por permitir a ediçao do orçamento, porem nao eh usado no programa
  def edit; end

  # POST /budgets
  # POST /budgets.json
  # O metodo create eh responsavel por permitir a criaçao de um orçamento
  # :reek:DuplicateMethodCall
  def create
    @budget = Budget.new(budget_params)
    create_confirm(@budget, 'Budget was successfully created.')
    #   respond_to do |format|
    # if @budget.save
    #   format.html do
    #     redirect_to @budget, notice: 'Budget was successfully created.'
    #   end
    # else
    #   format.html { render :new }
    # end
    #end
    end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  # o metodo update eh responsavel por permitir a atualizaçao de um orçamento, porem nao eh empregado no programa
  # :reek:DuplicateMethodCall
  def update
    update_with_params(@budget, budget_params, 'Budget was succesfully updated.')
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  # O metodo destroy permite a deleçao de um orçamento, mas nao eh empregado no programa
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
    end
  end
=end

  private

  # Use callbacks to share common setup or constraints between actions.
  #def set_budget
  #  @budget = Budget.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  #def budget_params
  #  params.require(:budget).permit(:value)
  #end

  attr_reader :budget
end
