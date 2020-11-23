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
      redirect_to new_source_path,alert:"Ocorreu um erro. Tente novamente."

    end  
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @source = Source.find(id) # look up movie by unique ID
  end

  def edit
    @source = Source.find params[:id]
  end
  
  def update
    @source = Source.find params[:id]
    @source.update_attributes!(source_params)
    flash[:notice] = "Fonte de informação atualizada."
    redirect_to source_path(@source)
  end
#parametros necessários para poder enviar o form
#caso nao passe o parametro name a página é recarregada com a mensagem de erro
  private
    def source_params
      params.require(:source).permit(:name)
    end

end
