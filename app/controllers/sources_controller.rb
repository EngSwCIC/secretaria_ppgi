class SourcesController < ApplicationController
#index onde há as fontes cadastradas
  def index
  	@sources=Source.all
  end
 
#página onde há o form de cadastro da fonte de informaçao
  def new
  	@source=Source.new

  end
#método utiliza a página do new para realizar o cadastro da fonte no BD
  def create
  	@source = Source.new(source_params)
    if @source.save
      redirect_to sources_path
    else
      redirect_to new_source_path,alert:"Não foi possível cadastrar fonte"

    end  
  end
#parametros necessários para poder enviar o form
#caso nao passe o parametro name a página é recarregada com a mensagem de erro
  private
    def source_params
      params.require(:source).permit(:name)
    end

end
