# O módulo RequirementsController controla os requerimentos
class RequirementsController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]
  before_action except: [:index, :show] do
    not_admin(requirements_path)
  end

  def initialize
    super
    @requirement = nil
  end

  # GET /requirements
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/1
  def show
  end

  # GET /requirements/new
  def new
    @requirement = Requirement.new
  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # :reek:DuplicateMethodCall
  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: "Requerimento criado com sucesso." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /requirements/1
  # :reek:DuplicateMethodCall
  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement, notice: "Requerimento atualizado com sucesso." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /requirements/1
  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: "Requerimento deletado com sucesso." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def requirement_params
    params.require(:requirement).permit(:name, :description)
  end
end
