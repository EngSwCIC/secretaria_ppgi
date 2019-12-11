# frozen_string_literal: true

# O módulo SolicitationsController é responsável por cuidar das solicitações do Usuário
class SolicitationsController < ApplicationController
  before_action :set_solicitation, only: %i[show edit update destroy accept refuse]
  before_action :authenticate_user!
  before_action :check_deadline, only: [:new]
  before_action except: %i[index show new create] do
    not_admin(solicitations_path)
  end

  def initialize
    super
    @solicitation = nil
    @last_setup = nil
  end

  # GET /solicitations
  def index
    @solicitations = Solicitation.all
  end

  # GET /solicitations/1
  def show; end

  # GET /solicitations/new
  def new
    @solicitation = Solicitation.new
  end

  # GET /solicitations/1/edit
  def edit; end

  # POST /solicitations
  # :reek:DuplicateMethodCall
  def create
    @solicitation = Solicitation.new(solicitation_params)
    @solicitation.user = current_user

    create_confirm(@solicitation, 'Solicitação criada com sucesso.', @solicitation)
  end

  # PATCH/PUT /solicitations/1
  # :reek:DuplicateMethodCall
  def update
    update_with_params(@solicitation, solicitation_params, 'Solicitação atualizada com sucesso.')
  end

  # DELETE /solicitations/1
  # :reek:DuplicateMethodCall
  def destroy
    @solicitation.destroy
    respond_to do |format|
      format.html { redirect_to solicitations_url, notice: 'Solicitação deletada com sucesso.' }
    end
  end


  # :reek:DuplicateMethodCall
  def accept
    respond_to do |format|
      if able_to_accept
        if @solicitation.update_attribute(:status, 'aprovado')
          decrement_value
          format.html { redirect_to solicitations_path, notice: 'Solicitação aprovada com sucesso.' }
        else
          format.html { render :index }
        end
      else
        format.html { redirect_to solicitations_path, notice: 'Orçamento insuficiente para realizar essa operação.' }
      end
    end
  end

  # :reek:DuplicateMethodCall
  def refuse
    respond_to do |format|
      if @solicitation.update_attribute(:status, 'reprovado')
        format.html { redirect_to solicitations_path, notice: 'Solicitação reprovada com sucesso.' }
      else
        format.html { render :index }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_solicitation
    @solicitation = Solicitation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def solicitation_params
    params.require(:solicitation).permit(:kind, :departure, :return, :origin, :destination, :description, :status)
  end

  def check_deadline
    @last_setup = Setup.last
    unless @last_setup.blank?
      unless ((@last_setup.inicio)..(@last_setup.fim)).cover? Time.now
        redirect_to root_path, notice: 'O prazo para criar solicitações expirou'
      end
    end
  end

  def decrement_value
    value = if @solicitation.kind == 'diaria'
              -800
            else
              -2000
            end
    add_value(value)
    Log.create(value: value, description: "Aprovação de solicitação do #{@solicitation.user.full_name}", budget_id: Budget.first.id)
  end

  def able_to_accept
    if @solicitation.status == 'analise'
      valor_atual = Budget.first.value
      if @solicitation.kind == 'diaria'
        return valor_atual >= 800
      else
        return valor_atual >= 2000
      end
    end
    false
  end

end
