class NotificationsController < ApplicationController
    def index
      @notifications = Notification.all
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
        redirect_to new_notifications_path,alert:"Ocorreu um erro"
  
      end  
    end
  
    private
      def notification_params
        params.require(:notification).permit(:title, :content, :interested_group)
      end
  
    def show
        @notification=Notification.find(params[:id])
    end
  end
  