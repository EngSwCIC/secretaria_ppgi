class RequestTypesController < ApplicationController
  before_action :set_request_type, only: [:show, :edit, :update, :destroy]

  # GET /request_types
  # GET /request_types.json
  def index
    @request_types = RequestType.all
  end

  # GET /request_types/1
  # GET /request_types/1.json
  def show
  end

  # GET /request_types/new
  def new
    @request_type = RequestType.new
  end

  # GET /request_types/1/edit
  def edit
  end

  # POST /request_types
  # POST /request_types.json
  def create
    @request_type = RequestType.new(request_type_params)

    respond_to do |format|
      if @request_type.save
        format.html { redirect_to @request_type, notice: 'Request type was successfully created.' }
        format.json { render :show, status: :created, location: @request_type }
      else
        format.html { render :new }
        format.json { render json: @request_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_types/1
  # PATCH/PUT /request_types/1.json
  def update
    respond_to do |format|
      if @request_type.update(request_type_params)
        format.html { redirect_to @request_type, notice: 'Request type was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_type }
      else
        format.html { render :edit }
        format.json { render json: @request_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_types/1
  # DELETE /request_types/1.json
  def destroy
    @request_type.destroy
    respond_to do |format|
      format.html { redirect_to request_types_url, notice: 'Request type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_type
      @request_type = RequestType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_type_params
      params.require(:request_type).permit(:title)
    end
end
