class RequestDeadlinesController < ApplicationController
  # GET /request_deadlines
  # GET /request_deadlines.json
  def index
    @request_deadlines = RequestDeadline.all
  end

  # GET /request_deadlines/new
  def new
    @request_deadline = RequestDeadline.new
  end

  # POST /request_deadlines
  # POST /request_deadlines.json
  def create
    @request_deadline = RequestDeadline.new(request_deadline_params)

    respond_to do |format|
      if @request_deadline.save
        format.html { redirect_to @request_deadline, notice: 'Request deadline was successfully created.' }
        format.json { render :show, status: :created, location: @request_deadline }
      else
        format.html { render :new }
        format.json { render json: @request_deadline.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def request_deadline_params
      params.require(:request_deadline).permit(:deadline)
    end
end
