##
# Essa classe contém os métodos que manipulam as entradas da wiki de atendimento
class WikiEntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  ##
  # GET /wikis.
  # Pega todos as entradas da wiki.
  # Método que mostra todas as entidades do tipo WikiEntry em uma lista e popula a página de index.
  def index
    @entries = WikiEntry.all
  end

  ##
  # GET /wikis/1.
  # Mostra a view da entrada.
  def show
  end

  ##
  # GET /wikis/new.
  # Cria a entrada, mas não salva no banco de dados.
  # O método new cria a variável entry e faz a requisiçao http para o form de criação.
  def new
    @entry= WikiEntry.new
  end

  ##
  # GET /wikis/1/edit.
  def edit
  end

  ##
  # POST /wikis.
  # Cria uma entrada da wiki no banco de dados.
  # O Método create é chamado após preencher o form de criação e popula as informaçoes.
  # Se houver erros na hora da criação retorna um aviso de erros. Não preencher o título por exemplo causa um erro. De outra forma ele leva para a página de show e avisa que a página foi criada com sucesso.
  # Recebe entry_params, que é constituído pelos campos título, conteúdo e documento.
  def create
    @entry= WikiEntry.new(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'Página foi criada com sucesso!'
    else
      render :new
    end
  end

  ##
  # PATCH/PUT /wikis/1.
  # Edita uma entrada e salva no banco de dados.
  # Utilizado para atualizar parte ou todos os campos da entity cuja id é passada pelo metodo http, similarmente à create ele retorna erros caso o objeto não possa ser criado.
  # Recebe entry_params, que é constituído pelos campos título, conteúdo e documento.
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Página editada com sucesso!'
    else
      render :edit 
    end
  end

  ##
  # DELETE /wikis/1.
  # Apaga uma entrada do banco de dados.
  # Método para excluir um objeto da tabela e redireciona para a página inicial com uma mensagem de sucesso.
  def destroy
    @entry.destroy
    redirect_to wiki_entries_url, notice: 'Wiki was successfully destroyed.' 
  end

  private
    ##
    # Use callbacks to share common setup or constraints between actions.
    # Utilizado para localizar a Entry com a ID passada
    def set_entry
      @entry= WikiEntry.find(params[:id])
    end

    ##
    # Never trust parameters from the scary internet, only allow the white list through.
    # Definido os parametros permitidos na criação e edição do objeto.
    def entry_params
      params.require(:wiki_entry).permit(:title, :content, :document)
    end
end
