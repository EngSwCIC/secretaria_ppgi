class ProcessController < ApplicationController
  def reload_processes(user)
    @processes = []
    processes_query = user.processos
    unless processes_query.nil?
      processes_query.each do |process|
        puts(process.attributes)
        @processes.append(process.attributes)
      end
    end
    @processes
  end

  def index
    if user_signed_in?
      @user = current_user
      reload_processes(@user)
    end
  end

  def create
    if user_signed_in?
      user = current_user
      permitted_params = params.require(:processo).permit(:sei_process_code, :process_status_id, :documents)
      process = user.processos.create(permitted_params)
      reload_processes(user)
    end
  end

  def delete
    if user_signed_in?
      user = current_user
      permitted_params = params.permit(:id)
      user.processos.destroy(permitted_params[:id])
      reload_processes(user)
    end
  end
end
