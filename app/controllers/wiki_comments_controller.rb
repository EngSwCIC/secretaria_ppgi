##
# Essa classe contém os métodos que manipulam os comentários das entradas da wiki de atendimento.
class WikiCommentsController < ApplicationController
  ##
  # Comentarios de cada entrada
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_entry, only:[:index, :new, :create]

  ##
  # GET /comments.
  # Pega todos os comentários da entrada.
  # Método que recupera um array com todos os comentários.
  def index
    @comments = WikiComment.all
  end

  ##
  # GET /comments/1.
  # Mostra a view do comentário.
  def show
  end

  ##
  # GET /comments/new.
  # Cria o comentário, mas não salva no banco de dados.
  def new
    @comment = WikiComment.new
  end

  ##
  # GET /comments/1/edit.
  def edit
  end

  ##
  # POST /comments.
  # Cria um comentário no banco de dados.
  # Método para a criação do comentário que faz a ligação da existencia desse comentário com uma Wikientry já criada, pois sem isso o comentário não pode existir.
  # Recebe como parâmetro um texto .
  # Verifica se o comentario pode ser salvo e se sim renderiza a página da entry a qual o comentário pertence, caso contrário, retorna um erro.
  def create
    @comment = WikiComment.new(comment_params.merge({entry: @entry}))
    if @comment.save
      redirect_to @comment.entry, notice:'Comentário foi criado com sucesso.'
    else
      render :new
    end
  end

  ##
  # PATCH/PUT /comments/1.
  # Edita um comentário.
  # Método que permite a atualização de um comentário. Esse método não está sendo utilizado no momento.
  def update
    if @comment.update(comment_params)
      redirect_to @comment.entry, notice: 'Comentário foi editado com sucesso.'
    else
      render :edit
    end
  end

  ##
  # DELETE /comments/1.
  # Apaga um comentário do banco de dados.
  # Método que permite apagar comentário e redireciona para a página de entrada com uma mensagem de sucesso.
  def destroy
    @comment.destroy
    redirect_to @comment.entry, notice: 'Comentário foi excluído com sucesso.' 
  end

  private
    ##
    # Use callbacks to share common setup or constraints between actions.
    # Método para localizar o comentário com a id específica
    def set_comment
      @comment = WikiComment.find(params[:id])
    end

    # Método para localizar a WikiEntry a qual o comentário pertence e ele é chamado antes das ações index, new e create dos comentários para que seja possível recupera-los ou setá-los em relação as devidas WikiEntries
    def set_entry
      @entry = WikiEntry.find(params[:wiki_entry_id])
    end

    ##
    # Never trust parameters from the scary internet, only allow the white list through.
    # Parametros permitidos a um comentário
    def comment_params
      params.require(:wiki_comment).permit(:content)
    end
end
