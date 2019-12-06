class SolicitationsController < ApplicationController
  before_action :set_solicitation, only: [:show, :edit, :update, :destroy, :accept, :refuse]
  before_action :authenticate_user!
  before_action :check_deadline, only: [:new]
  before_action except: [:index, :show, :new, :create] do
    not_admin(solicitations_path)
  end
  # GET /solicitations
  # GET /solicitations.json
  def index
    @solicitations = Solicitation.all
  end

  # GET /solicitations/1
  # GET /solicitations/1.json
  def show
  end

  # GET /solicitations/new
  def new
    @solicitation = Solicitation.new
  end

  # GET /solicitations/1/edit
  def edit
  end

  # POST /solicitations
  # POST /solicitations.json
  def create
    @solicitation = Solicitation.new(solicitation_params)
    @solicitation.user = current_user

    respond_to do |format|
      if @solicitation.save
        format.html { redirect_to @solicitation, notice: 'Solicitação criada com sucesso.' }
        format.json { render :show, status: :created, location: @solicitation }
      else
        format.html { render :new }
        format.json { render json: @solicitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitations/1
  # PATCH/PUT /solicitations/1.json
  def update
    respond_to do |format|
      if @solicitation.update(solicitation_params)
        format.html { redirect_to @solicitation, notice: 'Solicitação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @solicitation }
      else
        format.html { render :edit }
        format.json { render json: @solicitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitations/1
  # DELETE /solicitations/1.json
  def destroy
    @solicitation.destroy
    respond_to do |format|
      format.html { redirect_to solicitations_url, notice: 'Solicitação deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  def accept

    respond_to do |format|
      if @solicitation.kind == 'diaria' && Budget.first.value < 800
        format.html {redirect_to solicitations_path, notice: 'Orçamento insuficiente para realizar operação.' }

      elsif @solicitation.kind == 'passagem' && Budget.first.value < 2000
        format.html {redirect_to solicitations_path, notice: 'Orçamento insuficiente para realizar operação.'}
      else
        if @solicitation.update_attribute(:status, "aprovado")
          if @solicitation.kind == 'diaria'
            BudgetsController.add_value(-800)
            Log.create(value: -800, description: "Aprovação de solicitação do #{@solicitation.user.full_name}", budget_id: Budget.first.id )

          else
            BudgetsController.add_value(-2000)
            Log.create(value: -2000, description: "Aprovação de solicitação do #{@solicitation.user.full_name}", budget_id: Budget.first.id )
          end
          format.html { redirect_to solicitations_path, notice: 'Solicitação aprovada com sucesso.' }
        else
          format.html { render :index }
        end
      end
    end
  end

  def refuse

    respond_to do |format|
      if @solicitation.update_attribute(:status, "reprovado")
        format.html { redirect_to solicitations_path, notice: 'Solicitação aprovada com sucesso.' }
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

    if !Setup.last.blank?
      unless (Setup.last.inicio..Setup.last.fim).cover? Time.now
        redirect_to root_path, notice: 'O prazo para criar solicitações expirou'
      end
    end
  end
end
