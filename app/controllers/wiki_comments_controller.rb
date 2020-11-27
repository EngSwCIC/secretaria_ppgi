class WikiCommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_entry, only:[:index, :new, :create]

  # GET /comments
  # GET /comments.json
  def index
    #Método que recupera um array com todos os comentários
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
    #Método para a criação do comentário que faz a ligação da existencia desse comentário com uma Wikientry já criada, pois sem isso o comentário não pode existir
    @comment = WikiComment.new(comment_params.merge({entry: @entry}))
    #verifica se o comentario pode ser salvo e se sim renderiza a página da entry a qual o comentário pertence, caso contrário, retorna um erro
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
    #Método que permite a atualização de um comentário. Esse método não está sendo utilizado no momento.
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
      #Método para localizar o comentário com a id específica
      @comment = WikiComment.find(params[:id])
    end

    
    def set_entry
      #método para localizar a WikiEntry a qual o comentário pertence e ele é chamado antes das ações index, new e create dos comentários para que seja possível recupera-los ou setá-los em relação as devidas WikiEntries
      @entry = WikiEntry.find(params[:wiki_entry_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      #Parametros permitidos a um comentário
      params.require(:wiki_comment).permit(:content)
    end
end
