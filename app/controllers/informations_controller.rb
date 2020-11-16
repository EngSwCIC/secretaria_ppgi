class InformationsController < ApplicationController
  def index
    @informations = Information.all.order("created_at DESC")
  end

  def new
    @information = Information.new
    @sources=Source.all
    #@information = Information.new(info_params)
  end

  def create
    params.require(:information)
    params[:information].permit(info_params)
    @information = Information.create!(info_params.merge(:published_by => current_user.id))
    if @information.save
      redirect_to informations_path
    else
      redirect_to new_information_path,alert:"Deu ruim"
    end
    #redirect_to informations_path
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    flash[:notice] = "#{@information.title} deleted."
    redirect_to informations_path
  end

  private
  def info_params
    params.require(:information).permit(:title, :content, :source_id)
  end
end
  