class SourcesController < ApplicationController
##
# Esse metodo representa a ação index da classe Source e renderiza a view
# index, que exibe todas fontes de informação cadastradas.
# Não retorna nenhum valor e não redireciona o usuário.
  def index
  	@sources=Source.all
  end
 
##
# Esse método representa a ação new da classe Source. 
# Renderiza a new view, que recebe dados para a criação de uma nova fonte.
# Não recebe parâmetros, não retorna valor e não redireciona o usuário.
  def new
  	@source=Source.new
  end

##
# Ação destroy da classe Source. Recebe como argumento alguma fonte enviada
# para o servidor. Essa notificação é então removida do banco de dados, o usuário é 
# redirecionado para a view index de fontes e uma mensagem confirmando a exclusão da
# fonte é exibida na tela.
# Não retorna valores.
  def destroy
    @source = Source.find(params[:id])
    @source.destroy
    flash[:notice] = "#{@source.name} removido."
    redirect_to sources_path
  end

##
# Esse é o método responsável por  adicionar uma nova entrada no banco de dados com os dados inseridos na view new,
# caso os dados recebidos sejam válidos.
# Caso os dados sejam válidos, uma nova entrada é criada no banco de dados e o usuário é
# redirecionado para a view index das fontes. Caso os dados não sejam válidos, o usuário é
# redirecionado para a view new e uma mensagem de erro é exibida na tela. 
# O método não retorna nenhum valor.  
  def create
  	@source = Source.new(source_params)
    if @source.save
      redirect_to sources_path
    else
      redirect_to new_source_path,alert:"Ocorreu um erro. Tente novamente."
    end  
  end


  ##
  # Ação show da classe Source. Recebe uma fonte como argumento, econtra-a no
  # banco de dados e renderiza a view show para aquela notificação, exibindo seus detalhes. 
  # Vale notar que essa view só é renderizada quando métodos redirecionam o usuário para ela.
  # Como o único campo relevante de uma fonte de informação é seu nome, não foi considerado muito
  # pertinente a inserção de um link para a view show de uma fonte de informação.
  # Não retorna valores e não redireciona o usuário.
  def show
    id = params[:id] # retrieve movie ID from URI route
    @source = Source.find(id) # look up movie by unique ID
  end

  ##
  # Ação de edit da classe Source. Recebe uma fonte de informação como argumento, encontra-a no
  # banco de dados e renderiza a view edit. Vale notar que essa view é bastante parecida com a view new, salvo 
  # que os dados atuais da fonte a ser editada já são renderizados junto da página.
  # Não retorna valores e não redireciona o usuário.
  def edit
    @source = Source.find params[:id]
  end
  
  ##
  # O método que é responsável por atualizar uma fonte de informação com os dados inseridos na view edit. Recebe 
  # os dados enviados pela edit view ao servidor. Caso os dados enviados sejam válidos, a entrada é modificada no banco
  # de dados e o usuário é redirecionado para a view show da fonte atualizada. Caso contrário, O usuário é redirecionado
  # para a view index e uma mensagem de erro é exibida na tela. Não retorna valores.     
  # Vale dizer que quando dados inválidos são recebidos, uma exceção é lançada e, por meio do tratamento dessa exceção
  # é que se realiza o procedimento para redirecionar o usuário e exibir a mensagem de erro na tela.
  def update
    @source = Source.find params[:id]
    @source.update_attributes!(source_params)
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Ocorreu um erro."
      redirect_to sources_path
    else
    flash[:notice] = "Fonte de informação atualizada."
    redirect_to source_path(@source)
  end
  
  ##
  # Permite que os atributos das infromações possam ser acessados por outros métodos neste módulo.
  private
    def source_params
      params.require(:source).permit(:name)
    end

end
