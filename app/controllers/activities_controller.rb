class ActivitiesController < ApplicationController
  before_action :require_login     # Eh necessario estar logado para ver o calendario
  before_action :admin_privileges  # Eh necessario ser admin para criar, editar e deletar uma atividade

  # permite que usuarios nao admins consigam ver as atividades e detalhes
  skip_before_action :admin_privileges, only: [:index, :show, :toggle_interest, :index_interests, :reset_interests]
  skip_before_action :require_login, only: [:reset_interests]

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    # Melhorar condição para salvar quando terminar o show do usuário
    if @activity.save
      flash[:created] = 'Activity created successfully!'
      redirect_to activities_path
    else
      flash[:not_created] = 'Activity not created!'
      render 'new'
    end
  end

  def index
    @activities =  Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      flash[:updated] = "Activity updated successfully!"
      redirect_to activity_path(params[:id])
    else
      flash[:not_updated] = "Taks was not updated!"
      redirect_to edit_activities_path
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    if @activity.destroy
      flash[:deleted] = "Activity deleted successfully!"
    else
      flash[:deleted] = "Activity was not deleted! Something must have gone wrong!"
    end
    redirect_to activities_path
  end

  # Metodo para um usuario definir interesse ou desinteresse em uma atividade
  def toggle_interest
    @activity = Activity.find(params[:id])

    if @activity.interesting == true
       @activity.update({:interesting => false})
    else
      @activity.update({:interesting => true})
    end
    redirect_to activities_path
  end

  # Metodo para filtrar as atividades de acordo com o interesse do usuario
  def index_interests
    @activities = Activity.all

    if @activities[0].interesting_filter
      @activities.update({:interesting_filter => false})
    else
      @activities.update({:interesting_filter => true})
    end

    redirect_to activities_path
  end

  # Metodo para garantir que os interesses de um usuario sejam soh dele
  def reset_interests
    @activities = Activity.all
    @activities.update({:interesting => false})

    if user_signed_in?
      @user = current_user
      @activities.each do |activity|
        if @user.interest_array.include?(activity.title)
          activity.update({:interesting => true})
        end
      end
      redirect_to activities_path
    else
      redirect_to new_user_session_path
    end

  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :date)
  end

  def require_login
    unless user_signed_in?
      flash[:error] = "Login necessário para acessar essa página"
      redirect_to root_path
    end
  end

  def admin_privileges
    unless current_user.role == "administrator"
      flash[:error] = "Conta de administrador necessaria para acessar essa página"
      redirect_to root_path
    end
  end
end
