class CredenciamentoController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show_form
        puts current_user.id
        if Credenciamento.where(:iduser => current_user.id).exists?
            render 'credenciamento/alreadyhascredenciamento'
        else
            render 'credenciamento/show_form'
        end
    end

    def create_credenciamento
        Credenciamento.create(iduser: current_user.id)
        redirect_to '/'
    end
end
