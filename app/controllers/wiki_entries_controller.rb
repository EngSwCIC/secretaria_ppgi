class WikiEntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    #Método que mostra todas as entidades do tipo WikiEntry em uma lista e popula a página de index
    @entries = WikiEntry.all
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
  
  end

  # GET /wikis/new
  def new
    #O método new cria a variável entry e faz a requisiçao http para o form de criação
    @entry= WikiEntry.new
  end

  # GET /wikis/1/edit
  def edit
  end

  # POST /wikis
  # POST /wikis.json
  def create
    #O Método create é chamado após preencher o form de criação e popula as informaçoes.
    @entry= WikiEntry.new(entry_params)
    #Se houver erros na hora da criação retorna um aviso de erros. Não preencher o título por exemplo causa um erro. De outra forma ele leva para a página de show e avisa que a página foi criada com sucesso
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
    #Utilizado para atualizar parte ou todos os campos da entity cuja id é passada pelo metodo http, similarmente à create ele retorna erros caso o objeto não possa ser criado
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
    #método para excluir um objeto da tabela
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to wiki_entries_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      #Utilizado para localizar a Entry com a ID passada
      @entry= WikiEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      #definido os parametros permitidos na criação e edição do objeto
      params.require(:wiki_entry).permit(:title, :content, :document)
    end
end
