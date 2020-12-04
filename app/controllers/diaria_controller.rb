class DiariaController < ApplicationController
  before_action :set_diarium, only: [:show, :edit, :update, :destroy]

  # GET /diaria
  # GET /diaria.json
  def index
    @diaria = Diarium.all
  end

  # GET /diaria/1
  # GET /diaria/1.json
  def show
  end

  # GET /diaria/new
  def new
    @diarium = Diarium.new
  end

  # GET /diaria/1/edit
  def edit
  end

  # POST /diaria
  # POST /diaria.json
  def create
    @diarium = Diarium.new(diarium_params)

    respond_to do |format|
      if @diarium.save
        format.html { redirect_to @diarium, notice: 'Diarium was successfully created.' }
        format.json { render :show, status: :created, location: @diarium }
      else
        format.html { render :new }
        format.json { render json: @diarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaria/1
  # PATCH/PUT /diaria/1.json
  def update
    respond_to do |format|
      if @diarium.update(diarium_params)
        format.html { redirect_to @diarium, notice: 'Diarium was successfully updated.' }
        format.json { render :show, status: :ok, location: @diarium }
      else
        format.html { render :edit }
        format.json { render json: @diarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaria/1
  # DELETE /diaria/1.json
  def destroy
    @diarium.destroy
    respond_to do |format|
      format.html { redirect_to diaria_url, notice: 'Diarium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diarium
      @diarium = Diarium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diarium_params
      params.require(:diarium).permit(:data_entrada, :data_saida)
    end
end
