class InformationsController < ApplicationController
  def index
    if params[:information] and params[:information][:source_id]
      @informations = Information.search(params[:information][:source_id]).order("created_at DESC")
    
    else
      @informations = Information.all.order("created_at DESC")
    end
  end

  def new
    @information = Information.new
    @sources=Source.all
    #@information = Information.new(info_params)
  end

  def create
    params.require(:information)
    params[:information].permit(information_params)
    @information = Information.new(information_params.merge(:published_by => current_user.id))
    if @information.save
      redirect_to informations_path
    else
      redirect_to new_information_path,alert:"Ocorreu um erro"
    end
    #redirect_to informations_path
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    flash[:notice] = "#{@information.title} removido."
    redirect_to informations_path
  end

  private

  def information_params
    params.require(:information).permit(:title, :content, :source_id, :published_by)
  end

end
  