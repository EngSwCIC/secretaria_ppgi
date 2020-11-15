class SourcesController < ApplicationController
  def index
  	@sources=Source.all
  end

  def show
  	@source=Source.find(params[:id])
  end

  def new
  	@source=Source.new
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy
    flash[:notice] = "#{@source.name} removido."
    redirect_to sources_path
  end

  def create
  	@source = Source.new(source_params)
    if @source.save
      redirect_to sources_path
    else
      redirect_to new_source_path,alert:"Ocorreu um erro"

    end  
  end

  private
    def source_params
      params.require(:source).permit(:name)
    end

end
