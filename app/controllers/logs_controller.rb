class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action {not_admin(root_path)}
  before_action only: [:index] do
    redirect_to(budgets_path)
  end

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1
  # GET /logs/1.json
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
  # POST /logs.json
  def create
    @log = Log.new(log_params)
    @log.budget = Budget.first
    respond_to do |format|

      retorno = add_value(@log.value)
      if retorno[0]
        if @log.save
          format.html { redirect_to budgets_path, notice: 'Movimentação criada com sucesso.' }
          format.json { render :show, status: :created, location: @log }
        else
          format.html {render :new, notice: 'Não foi possível criar histórico.'}
        end
      else
        format.html { redirect_to budgets_path , notice: retorno[1] }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      old_value = @log.value
      if @log.update(log_params)
        add_value(@log.value - old_value)
        format.html { redirect_to @log, notice: 'Movimentação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Movimentação deletada com sucesso.' }
      format.json { head :no_content }
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
