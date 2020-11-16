class NotificationController < ApplicationController
  def index
    @notification = Notification.all
  end
  
  def new
    @notification = Notification.new

  end

  def create
    @notification = Notification.new(source_params)
    if @notification.save
      redirect_to notification_path
    else
      redirect_to new_notification_path,alert:"Deu ruim"

    end  
  end

  private
    def notification_params
      params.require(:notification).permit(:title)
    end

  def show
  	@notification=Notification.find(params[:id])
  end
end
