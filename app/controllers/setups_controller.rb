# O módulo SetupsController é usado para criar os prazos
class SetupsController < ApplicationController
  before_action :set_setup, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action except: [:index, :show] do
    not_admin(setups_path)
  end

  def initialize
    super
    @setup = nil
  end

  # GET /setups
  def index
    @setups = Setup.all
  end

  # GET /setups/1
  def show
  end

  # GET /setups/new
  def new
    @setup = Setup.new
  end

  # GET /setups/1/edit
  def edit
  end

  # POST /setups
  # :reek:DuplicateMethodCall
  def create
    @setup = Setup.new(setup_params)
    create_confirm(@setup, "Prazo criado com sucesso.", @setup)
  end

  # PATCH/PUT /setups/1
  # :reek:DuplicateMethodCall
  def update
    update_with_params(@setup, setup_params,  "Prazo atualizado com sucesso.")
  end

  # DELETE /setups/1
  # :reek:DuplicateMethodCall
  def destroy
    @setup.destroy
    respond_to do |format|
      format.html { redirect_to setups_url, notice: "Prazo deletado com sucesso." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_setup
    @setup = Setup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def setup_params
    params.require(:setup).permit(:inicio, :fim)
  end

end
