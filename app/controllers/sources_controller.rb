# This class hangle crud operations for information source.
class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit
  end

  def operation msg, symbol
    respond_to do |format|
      format.html { redirect_to @source, notice: msg }
      format.json { render :show, status: symbol.to_sym , location: @source }
    end
  end

  def not_operation symbol
    respond_to do |format|
      format.html { render symbol.to_sym }
      format.json { render json: @source.errors, status: :unprocessable_entity }
    end
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new source_params
    @source.save ? operation("Source was successfully created.", "created") : not_operation("new")
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    @source.update(source_params) ? operation("Source was successfully updated.", "ok") : not_operation("edit")
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: 'Source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_params
      params.require(:source).permit(:title)
    end
end
