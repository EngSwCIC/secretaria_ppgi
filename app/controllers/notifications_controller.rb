class NotificationsController < ApplicationController
    def create
        flash[:notice] = "Notificação enviada aos interessados com sucesso."
        redirect_to activities_path
    end
end