class ProcessController < ApplicationController
  before_action :require_login

  def reload_processes(user)
    @processes = []
    unless user.nil?
      processes_query = user.processos.nil? ? [] : user.processos;
      processes_query.each do |process|
        @processes.append(process.attributes)
      end
    end
    @processes
  end

  def reset_status
    @available_status = []
    @status = {}
  end

  def load_status
    reset_status
    ProcessStatus.find_each do |status|
      id, label = status.label, status.id
      @available_status.append([label, id])
      @status[id] = label
    end
  end

  def load_filters
    load_status
    @filters = @available_status
    @filters.append(['Todos', -1])
  end

  def filter_processes(filter_status)
    reload_processes(current_user)
    @current_filter = filter_status
    @current_filter = filter_status.to_i
    if @current_filter != -1
      @processes = @processes.select do |process|
        process['process_status_id'] == filter_status
      end
    end
  end

  def index
    load_status
    load_filters
    reload_processes(current_user)
    filter_by = params['filter_by']
    filter_status = filter_by.nil? ? -1 : filter_by['filter_status'].to_i
    filter_processes(filter_status)
  end

  def search
    permitted_params = params.require(:filter_by).permit(:filter_status)
    filter_status = permitted_params['filter_status']
    if filter_status.nil?
      filter_status = -1
    end
    filter_processes(filter_status)
    redirect_to process_home_path(:filter_by => permitted_params['filter_status'])
  end

  def show
    load_status
    permitted_params = params.permit(:id)
    @process = current_user.processos.find(permitted_params[:id])
  end

  def create
    user = current_user
    permitted_params = params.require(:processo).permit(:sei_process_code, :process_status_id, :document_files => [])
    @process = user.processos.create({"sei_process_code": permitted_params["sei_process_code"], "process_status_id": permitted_params["process_status_id"]})
    @process.save
    docs = permitted_params["document_files"]
    unless docs.nil?
      docs.each do |doc|
        doc_model = {"processo_id": @process[:id], "data" => doc.read, "filename": doc.original_filename, "mime_type": doc.content_type}
        @process.documents.create(doc_model)
      end
    end
    reload_processes(user)
    redirect_to process_home_path
  end

  def serve
    permitted_params = params.permit(:process_id, :document_id)
    @doc = user.processos.find(permitted_params).documents.find(document_id)
    send_data(@doc.data, :type => @doc.mime_type, :filename => @doc.filename, :disposition => "inline")
  end

  def destroy
    user = current_user
    permitted_params = params.permit(:id)
    user.processos.destroy(permitted_params[:id])
    reload_processes(user)
    redirect_to process_home_path
  end


  private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
