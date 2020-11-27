class ProcessController < ApplicationController
  def reload_processes(user)
    @processes = []
    processes_query = user.processos
    unless processes_query.nil?
      processes_query.each do |process|
        @processes.append(process.attributes)
      end
    end
    @processes
  end

  def load_status()
    @available_status = []
    @status = {}
    ProcessStatus.find_each do |status|
      @available_status.append([status.label, status.id])
      @status[status.id] = status.label
    end
    puts(@status)
  end

  def index
    if user_signed_in?
      load_status
      user = current_user
      reload_processes(user)
      puts(@processes)
    else
      redirect_to home_path
    end

  end

  def create
    if user_signed_in?
      user = current_user
      permitted_params = params.require(:processo).permit(:sei_process_code, :process_status_id, :document_files => [])
      process = user.processos.create({"sei_process_code": permitted_params["sei_process_code"], "process_status_id": permitted_params["process_status_id"]})
      process.save
      permitted_params["document_files"].each do |doc|
        doc_model = {"processo_id": process[:id], "data" => doc.read, "filename": doc.original_filename, "mime_type": doc.content_type}
        process.documents.create(doc_model)
      end
      reload_processes(user)
      redirect_to process_home_path
    else
      redirect_to home_path
    end

  end

  def destroy
    if user_signed_in?
      user = current_user
      permitted_params = params.permit(:id)
      user.processos.destroy(permitted_params[:id])
      reload_processes(user)
      redirect_to process_home_path
    else
      redirect_to home_path
    end

  end
end
