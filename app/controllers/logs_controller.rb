# O módulo LogsController cuida do histírico das movimentações de valores
class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action {not_admin(root_path)}
  before_action only: [:index] do
    redirect_to(budgets_path)
  end

  def initialize
    super
    @log = nil
  end

  # GET /logs
  def index
    @logs = Log.all
  end

  # GET /logs/1
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # :reek:DuplicateMethodCall
  def create
    @log = Log.new(log_params)
    @log.budget = Budget.first

    retorno = add_value(@log.value)
    if retorno[0]
      create_confirm(@log, 'Movimentação criada com sucesso.', budgets_path)
    else
      format.html { redirect_to budgets_path , notice: retorno[1] }
    end

  end

  # PATCH/PUT /logs/1
  # :reek:DuplicateMethodCall
  def update
    respond_to do |format|
      old_value = @log.value
      if @log.update(log_params)
        add_value(@log.value - old_value)
        format.html { redirect_to @log, notice: 'Movimentação atualizada com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /logs/1
  # :reek:DuplicateMethodCall
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Movimentação deletada com sucesso.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = Log.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def log_params
    params.require(:log).permit(:value, :description)
  end
end
