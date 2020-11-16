class WikiCommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_entry, only:[:index, :new, :create]

  # GET /comments
  # GET /comments.json
  def index
    @comments = WikiComment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = WikiComment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    
    @comment = WikiComment.new(comment_params.merge({entry: @entry}))
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.entry, notice: 'Comentário foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.entry, notice: 'Comentário foi editado com sucesso.' }
        format.json { render :show, status: :ok, location: @comment.entry }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.entry, notice: 'Comentário foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = WikiComment.find(params[:id])
    end

    
    def set_entry
      @entry = WikiEntry.find(params[:wiki_entry_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:wiki_comment).permit(:content)
    end
end
