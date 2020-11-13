class SeiProcessesController < ApplicationController
  before_action :set_sei_process, only: [:show, :edit, :update, :destroy]

  # GET /sei_processes
  # GET /sei_processes.json
  def index
    @sei_processes = SeiProcess.all
  end

  # GET /sei_processes/1
  # GET /sei_processes/1.json
  def show
  end

  # GET /sei_processes/new
  def new
    @sei_process = SeiProcess.new
  end

  # GET /sei_processes/1/edit
  def edit
  end

  # POST /sei_processes
  # POST /sei_processes.json
  def create
    @sei_process = SeiProcess.new(sei_process_params)

    respond_to do |format|
      if @sei_process.save
        format.html { redirect_to @sei_process, notice: 'Sei process was successfully created.' }
        format.json { render :show, status: :created, location: @sei_process }
      else
        format.html { render :new }
        format.json { render json: @sei_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sei_processes/1
  # PATCH/PUT /sei_processes/1.json
  def update
    respond_to do |format|
      if @sei_process.update(sei_process_params)
        format.html { redirect_to @sei_process, notice: 'Sei process was successfully updated.' }
        format.json { render :show, status: :ok, location: @sei_process }
      else
        format.html { render :edit }
        format.json { render json: @sei_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sei_processes/1
  # DELETE /sei_processes/1.json
  def destroy
    @sei_process.destroy
    respond_to do |format|
      format.html { redirect_to sei_processes_url, notice: 'Sei process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sei_process
      @sei_process = SeiProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sei_process_params
      params.require(:sei_process).permit(:user_id, :status, :code)
    end
end
