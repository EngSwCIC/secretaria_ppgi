class AccreditationsController < ApplicationController
  before_action :set_accreditation, only: [:show, :edit, :update, :destroy]

  # GET /accreditations
  # GET /accreditations.json
  def index
    @accreditations = Accreditation.all
  end

  # GET /accreditations/1
  # GET /accreditations/1.json
  def show
  end

  # GET /accreditations/new
  def new
  end

  # GET /accreditations/1/edit
  def edit
  end

  # POST /accreditations
  # POST /accreditations.json
  def create
    @accreditation = Accreditation.new(accreditation_params)

    respond_to do |format|
      if @accreditation.save
        format.html { redirect_to accreditations_url, notice: 'Accreditation was successfully created.' }
        format.json { render :show, status: :created, location: @accreditation }
      else
        format.html { render :new }
        format.json { render json: @accreditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accreditations/1
  # PATCH/PUT /accreditations/1.json
  def update
    respond_to do |format|
      if @accreditation.update(accreditation_params)
        format.html { redirect_to accreditations_url, notice: 'Accreditation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accreditation }
      else
        format.html { render :edit }
        format.json { render json: @accreditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accreditations/1
  # DELETE /accreditations/1.json
  def destroy
    @accreditation.destroy
    respond_to do |format|
      format.html { redirect_to accreditations_url, notice: 'Accreditation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accreditation
      @accreditation = Accreditation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accreditation_params
      params.require(:accreditation).permit(:user_id, :start_date, :end_date, :sei_proccess_id)
    end
end
