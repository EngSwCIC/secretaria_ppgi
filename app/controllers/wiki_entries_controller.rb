class WikiEntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    @entries = WikiEntry.all
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
  
  end

  # GET /wikis/new
  def new
    @entry= WikiEntry.new
  end

  # GET /wikis/1/edit
  def edit
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @entry= WikiEntry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Página foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @entry}
      else
        format.html { render :new}
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Página foi criada com sucesso!' }
        format.json { render :show, status: :ok, location: @entry}
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.jso
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to wiki_entries_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry= WikiEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:wiki_entry).permit(:title, :content)
    end
end
