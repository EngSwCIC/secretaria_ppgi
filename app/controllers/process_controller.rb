##
# ProcessController class implements all methods for interacting with process
# asset
#
class ProcessController < ApplicationController
  before_action :require_login

  ##
  # reload_processes reloads @process variable for a user requesting a Process page
  #
  # this methods changes instance var @process
  #
  # @param user: devise logged user
  #
  # @return [Processo]
  def reload_processes(user)
    @processes = []
    unless user.nil?
      user_processes = user.processos
      processes_query = user_processes.nil? ? [] : user_processes;
      processes_query.each do |process|
        @processes.append(process.attributes)
      end
    end
    @processes
  end

  ##
  # reset_status resets instance variables relative to process_status
  #
  # @return
  def reset_status
    @available_status = []
    @status = {}
  end

  def attach
    permitted_params = params.permit(:id, :document_files => [])
    docs = permitted_params['document_files']
    unless docs.nil?
      docs.each do |doc|
        doc_model = {"processo_id": permitted_params[:id], "data" => doc.read, "filename": doc.original_filename, "mime_type": doc.content_type}
        @process.documents.create(doc_model)
      end
    end
    @process = current_user.processos.find(permitted_params[:id])
  end

  ##
  # load_status load @available_status and @status for view to access it
  #
  # @return
  def load_status
    reset_status
    ProcessStatus.find_each do |status|
      id, label = status.id, status.label
      @available_status.append([label, id])
      @status[id] = label
    end
  end

  ##
  # load_filters returns filters that a user can apply to filter_status
  #
  # @returns [[String, Int]]
  def load_filters
    load_status
    @filters = @available_status.map do |item|
      item
    end
    @filters.append(['Todos', -1])
  end

  ##
  # filter_processes selects processes with requested status_id only
  #
  # @param filter_status: Int
  #
  # @return
  def filter_processes(filter_status)
    reload_processes(current_user)
    @current_filter = filter_status
    if @current_filter != -1
      @processes = @processes.select do |process|
        process['process_status_id'] == filter_status
      end
    end
  end

  ##
  # index renders the process index page and returns filtered processes
  #
  # it can be GET with ?filter_by=status_id
  # @return [Processo]
  def index
    load_status
    load_filters

    reload_processes(current_user)
    filter_by = params['filter_by']
    filter_status = filter_by.nil? ? -1 : filter_by.to_i
    filter_processes(filter_status)
  end

  ##
  # search filters processes by a status_id passed as parameter in the form {filter_by: {filter_status: Int}}
  #
  # redirects to home with filtered table rendered
  def search
    permitted_params = params.require(:filter_by).permit(:filter_status)
    filter_status = permitted_params['filter_status']
    filter_processes(filter_status)
    redirect_to process_home_path(:filter_by => filter_status)
  end

  ##
  # show a process with an id as url parameter
  #
  # changes instance @process to requested process
  #
  # @return
  def show
    load_status
    permitted_params = params.permit(:id)
    @process = current_user.processos.find(permitted_params[:id])
  end

  ##
  # create will create a new entry on db for an user
  #
  # redirects to home with new created process attached to table on process index
  def create
    permitted_params = params.require(:processo).permit(:sei_process_code, :process_status_id, :document_files => [])
    @process = current_user.processos.create({"sei_process_code": permitted_params["sei_process_code"], "process_status_id": permitted_params["process_status_id"]})
    @process.save
    docs = permitted_params["document_files"]
    unless docs.nil?
      docs.each do |doc|
        doc_model = {"processo_id": @process[:id], "data" => doc.read, "filename": doc.original_filename, "mime_type": doc.content_type}
        @process.documents.create(doc_model)
      end
    end
    reload_processes(current_user)
    puts(@process)
    redirect_to process_home_path
  end

  ##
  # serve returns a document attached to a process
  #
  # returns a data url to enable user to download it
  def serve
    permitted_params = params.permit(:id, :doc_id)
    @doc = current_user.processos.find(permitted_params['id']).documents.find(permitted_params["doc_id"])
    send_data(@doc.data, :type => @doc.mime_type, :filename => @doc.filename, :disposition => "inline")
  end

  ##
  # destroy removes an process with an id={id} from a user's process
  # it changes database
  def destroy
    permitted_params = params.permit(:id)
    current_user.processos.destroy(permitted_params[:id])
    reload_processes(current_user)
    redirect_to process_home_path
  end


  private

  ##
  # require_login redirects to homepage everytime a guest user tries to request /process
  #
  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
