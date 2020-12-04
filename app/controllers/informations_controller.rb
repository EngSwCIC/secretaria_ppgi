class InformationsController < ApplicationController
  ##
  # Esse metodo representa a ação index da classe information e renderiza a view
  # index, que exibe todas informações cadastradas ou apenas as informações postadas por
  # uma determinada fonte, passada como parâmetro para esse método juntamente com a informação postada.
  # Não retorna nenhum valor e não redireciona o usuário.
  def index
    if params[:information] and params[:information][:source_id]
      @informations = Information.search(params[:information][:source_id]).order("created_at DESC")
    
    else
      @informations = Information.all.order("created_at DESC")
    end
  end

  ##
  # Esse método representa a ação new da classe information. 
  # Renderiza a new view, que recebe dados para a criação de uma nova informação. 
  # Vale notar que a new view recebe todas fontes cadastradas,
  # para a possiblitar funcionalidade de filtrar notícias por fonte.
  # Não retorna valor e não redireciona o usuário.
  def new
    @information = Information.new
    @sources=Source.all
    #@information = Information.new(info_params)
  end

  ##
  # Esse é o método responsável por  adicionar uma nova entrada no banco de dados com os dados inseridos na view new,
  # caso os dados recebidos sejam válidos.
  # Caso os dados sejam válidos, uma nova entrada é criada no banco de dados e o usuário é
  # redirecionado para a view index das informações. Caso os dados não sejam válidos, o usuário é
  # redirecionado para a view new e uma mensagem de erro é exibida na tela. 
  # O método não retorna nenhum valor.
  def create
    params.require(:information)
    params[:information].permit(information_params)
    @information = Information.new(information_params.merge(:published_by => current_user.id))
    if @information.save
      redirect_to informations_path
    else
      redirect_to new_information_path,alert:"Ocorreu um erro."
    end
    #redirect_to informations_path
  end

  ##
  # Ação destroy da classe Information. Recebe como argumento alguma informação enviada
  # para o servidor. Essa informação é então removida do banco de dados, o usuário é 
  # redirecionado para a view index de informações e uma mensagem confirmando a exclusão da
  # informação é exibida na tela.
  # Não retorna valores.
  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    flash[:notice] = "#{@information.title} removido."
    redirect_to informations_path
  end

  ##
  # Ação show da classe Information. Recebe uma informação como argumento, econtra essa informação no
  # banco de dados e renderiza a view show para aquela informação. 
  # Não retorna valores e não redireciona o usuário.
  def show
    id = params[:id] 
    @information = Information.find(id) 
  end

  ##
  # Ação de edit da classe Information. Recebe uma informação como argumento, encontra essa informação no
  # banco de dados e renderiza a view edit. Vale notar que essa view é bastante parecida com a view new, salvo 
  # que os dados atuais da informação a ser editada já são renderizados junto da página.
  # As fontes de informação cadastradas são enviadas para o servidor junto com a informação para que seja possível
  # mudar a fonte da informação, caso desejado. Não retorna valores e não redireciona o usuário.
  def edit
    @information = Information.find params[:id]
    @sources=Source.all
  end

  ##
  # O método que é responsável por atualizar uma informação com os dados inseridos na view edit. Recebe 
  # os dados enviados pela edit view ao servidor. Caso os dados enviados sejam válidos, a entrada é modificada no banco
  # de dados e o usuário é redirecionado para a view show da informação atualizada. Caso contrário, O usuário é redirecionado
  # para a view index e uma mensagem de erro é exibida na tela. Não retorna valores. 
  # Vale dizer que quando dados inválidos são recebidos, uma exceção é lançada e, por meio do tratamento dessa exceção
  # é que se realiza o procedimento para redirecionar o usuário e exibir a mensagem de erro na tela.
  def update
    @information = Information.find params[:id]
    @information.update_attributes!(information_params)
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Ocorreu um erro."
      redirect_to informations_path
    else
    flash[:notice] = "Informação atualizada."
    redirect_to information_path(@information)
    end
    

  private

  ##
  # Permite que os atributos das infromações possam ser acessados por outros métodos neste módulo.
  def information_params
    params.require(:information).permit(:title, :content, :source_id, :published_by)
  end

end
  