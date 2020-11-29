class NotificationsController < ApplicationController
  
    def index
      if current_user.role == 'administrator'
        @notifications = Notification.all
      elsif current_user.role == 'secretary'
        @notifications = Notification.where(interested_group: 'Secretário')
      elsif current_user.role == 'professor'
        @notifications = Notification.where(interested_group: 'Professor')
      elsif current_user.role == 'student'
        @notifications = Notification.where(interested_group: 'Estudante')
      end


    end
    
    def new
      @notifications = Notification.new
  
    end

    def destroy
      @notification = Notification.find(params[:id])
      @notification.destroy
      flash[:notice] = "#{@notification.title} removido."
      redirect_to notifications_path
    end
  
    def create
      params.require(:notification)
      params[:notification].permit(notification_params)
      @notification = Notification.new(notification_params)
      if @notification.save
        redirect_to notifications_path
      else
        redirect_to new_notifications_path,alert:"Ocorreu um erro. Tente novamente."
  
      end  
    end


    def edit
      @notification = Notification.find params[:id]
    end
    
    def update
      @notification = Notification.find params[:id]
      @notification.update_attributes!(notification_params)
      flash[:notice] = "Notificação atualizada."
      redirect_to notification_path(@notification)
    end

    def show
      id = params[:id] # retrieve movie ID from URI route
      @notification = Notification.find(id) # look up movie by unique ID
    end
  
    private
      def notification_params
        params.require(:notification).permit(:title, :content, :interested_group)
      end
  end
  