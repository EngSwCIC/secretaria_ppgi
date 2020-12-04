class NotificationsController < ApplicationController
  ##
  # Esse metodo representa a ação index da classe Notification e renderiza a view
  # index, que exibe todas notificações cadastradas caso o usuário seja um administrador.
  # Caso o usuário não seja um administrador, são exibidas apenas as notificações de interesse do grupo do qual
  # o usuário faz parte.
  # Não retorna nenhum valor e não redireciona o usuário.
    def index
        @notifications = Notification.all
      if current_user.role == 'secretary'
        @notifications = Notification.where(interested_group: 'Secretário')
      elsif current_user.role == 'professor'
        @notifications = Notification.where(interested_group: 'Professor')
      elsif current_user.role == 'student'
        @notifications = Notification.where(interested_group: 'Estudante')
      end
    end
    
  ##
  # Esse método representa a ação new da classe Notification. 
  # Renderiza a new view, que recebe dados para a criação de uma nova notificação.
  # Não recebe parâmetros, não retorna valor e não redireciona o usuário.
    def new
      @notifications = Notification.new
  
    end

  ##
  # Ação destroy da classe Notification. Recebe como argumento alguma notificação enviada
  # para o servidor. Essa notificação é então removida do banco de dados, o usuário é 
  # redirecionado para a view index de notificaões e uma mensagem confirmando a exclusão da
  # notificação é exibida na tela.
  # Não retorna valores.
    def destroy
      @notification = Notification.find(params[:id])
      @notification.destroy
      flash[:notice] = "#{@notification.title} removido."
      redirect_to notifications_path
    end

  ##
  # Esse é o método responsável por  adicionar uma nova entrada no banco de dados com os dados inseridos na view new,
  # caso os dados recebidos sejam válidos.
  # Caso os dados sejam válidos, uma nova entrada é criada no banco de dados e o usuário é
  # redirecionado para a view index das notificações. Caso os dados não sejam válidos, o usuário é
  # redirecionado para a view new e uma mensagem de erro é exibida na tela. 
  # O método não retorna nenhum valor.  
    def create
      params.require(:notification)
      params[:notification].permit(notification_params)
      @notification = Notification.new(notification_params)
      if @notification.save
        redirect_to notifications_path
      else
        redirect_to new_notification_path,alert:"Ocorreu um erro. Tente novamente."
  
      end  
    end

  ##
  # Ação de edit da classe Notification. Recebe uma notificação como argumento, encontra-a no
  # banco de dados e renderiza a view edit. Vale notar que essa view é bastante parecida com a view new, salvo 
  # que os dados atuais da notificação a ser editada já são renderizados junto da página.
  # Não retorna valores e não redireciona o usuário.
    def edit
      @notification = Notification.find params[:id]
    end

  ##
  # O método que é responsável por atualizar uma notificação com os dados inseridos na view edit. Recebe 
  # os dados enviados pela edit view ao servidor. Caso os dados enviados sejam válidos, a entrada é modificada no banco
  # de dados e o usuário é redirecionado para a view show da notificação atualizada. Caso contrário, O usuário é redirecionado
  # para a view index e uma mensagem de erro é exibida na tela. Não retorna valores.     
  # Vale dizer que quando dados inválidos são recebidos, uma exceção é lançada e, por meio do tratamento dessa exceção
  # é que se realiza o procedimento para redirecionar o usuário e exibir a mensagem de erro na tela.
    def update
      @notification = Notification.find params[:id]
      @notification.update_attributes!(notification_params)
      rescue ActiveRecord::RecordInvalid
        flash[:notice] = "Ocorreu um erro."
        redirect_to notifications_path
      else
      flash[:notice] = "Notificação atualizada."
      redirect_to notification_path(@notification)
    end
    
  ##
  # Ação show da classe Notification. Recebe uma notificação como argumento, econtra-a no
  # banco de dados e renderiza a view show para aquela notificação, exibindo seus detalhes. 
  # Não retorna valores e não redireciona o usuário.
    def show
      id = params[:id] # retrieve movie ID from URI route
      @notification = Notification.find(id) # look up movie by unique ID
    end
  
  ##
  # Permite que os atributos das infromações possam ser acessados por outros métodos neste módulo.
    private
      def notification_params
        params.require(:notification).permit(:title, :content, :interested_group)
      end
  end
  