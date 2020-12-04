class ProcessController < ApplicationController
  def reload_processes(user)
    @processes = []
    unless user.nil?
      processes_query = user.processos
      unless processes_query.nil?
        processes_query.each do |process|
          @processes.append(process.attributes)
        end
      end
    end
    @processes
  end

  def load_status
    @available_status = []
    @status = {}
    ProcessStatus.find_each do |status|
      @available_status.append([status.label, status.id])
      @status[status.id] = status.label
    end
  end

  def load_filters
    load_status
    @filters = @available_status
    @filters.append(['Todos', -1])
  end

  def filter_processes(filter_status)
    reload_processes(current_user)
    unless @processes.nil?
      @current_filter = filter_status
      @current_filter = filter_status.to_i
      if @current_filter != -1
        @processes = @processes.select do |process|
          process['process_status_id'] == filter_status
        end
      end
    end
  end

  def index
    if user_signed_in?
      load_status
      load_filters
      user = current_user
      reload_processes(user)
      filter_status = params['filter_by']
      if filter_status.nil?
        filter_status = -1
      else
        filter_status = filter_status.to_i
      end
      filter_processes(filter_status)
    else
      redirect_to home_path
    end
  end

  def search
    if user_signed_in?
      permitted_params = params.require(:filter_by).permit(:filter_status)
      filter_status = permitted_params['filter_status']
      if filter_status.nil?
        filter_status = -1
      end
      filter_processes(filter_status)
      redirect_to process_home_path(:filter_by => permitted_params['filter_status'])
    else
      redirect_to home_path
    end

  end

  def show
    if user_signed_in?
      load_status
      permitted_params = params.permit(:id)
      @process = current_user.processos.find(permitted_params[:id])
    end
  end

  def create
    if user_signed_in?
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
    else
      redirect_to home_path
    end
  end

  def serve
    if user_signed_in?
      permitted_params = params.permit(:process_id, :document_id)
      @doc = user.processos.find(permitted_params).documents.find(document_id)
      send_data(@doc.data, :type => @doc.mime_type, :filename => @doc.filename, :disposition => "inline")
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
