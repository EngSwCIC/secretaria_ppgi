class SourcesController < ApplicationController
#index onde há as fontes cadastradas
  def index
  	@sources=Source.all
  end
 
#página onde há o form de cadastro da fonte de informaçao
  def new
  	@source=Source.new
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy
    flash[:notice] = "#{@source.name} removido."
    redirect_to sources_path
  end
#método utiliza a página do new para realizar o cadastro da fonte no BD
  def create
  	@source = Source.new(source_params)
    if @source.save
      redirect_to sources_path
    else
      redirect_to new_source_path,alert:"Ocorreu um erro"

    end  
  end
#parametros necessários para poder enviar o form
#caso nao passe o parametro name a página é recarregada com a mensagem de erro
  private
    def source_params
      params.require(:source).permit(:name)
    end

=begin
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

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: 'Source was successfully created.' }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:source).permit(:name)
    end

=end

end

