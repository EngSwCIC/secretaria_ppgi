class ProcessStatusController < ApplicationController
  def reload_processesstatuses(user)
    @processesstatuses = []
    processesstatuses_query = user.processosstatuses
    unless processesstatuses_query.nil?
      processesstatuses_query.each do |processstatus|
        @processesstatuses.append(processstatus.attributes)
      end
    end
    @processesstatuses
  end

  def load_status
    @available_status = []
    @status = {}
    ProcessStatus.find_each do |status|
      @available_status.append([status.label, status.id])
      @status[status.id] = status.label
    end
  end

  def show
    if user_signed_in?
      load_status
      permitted_params = params.permit(:id)
      @processstatus = current_user.processosstatus.find(permitted_params[:id])
    end
  end

  def create
    if user_signed_in?
      user = current_user
      permitted_params = params.require(:processostatus).permit(:name, :label)
      processstatus = user.processosstatus.create({"name": permitted_params["name"],"label": permitted_params["label"]})
      processstatus.save
      reload_processesstatuses(user)
      redirect_to processstatus_home_path
    else
      redirect_to home_path
    end
  end

  def destroy
    if user_signed_in?
      user = current_user
      permitted_params = params.permit(:id)
      user.processosstatus.destroy(permitted_params[:id])
      reload_processesstatuses(user)
      redirect_to processstatus_home_path
    else
      redirect_to home_path
    end

  end
end