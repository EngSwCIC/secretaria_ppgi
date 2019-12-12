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

    def show_formrecredenciamento
        if Credenciamento.where(:iduser => current_user.id).exists?
            render 'credenciamento/show_recredenciamento'
        else
            render 'credenciamento/show_form'
        end
    end

    def show_formperiodos
        render 'credenciamento/show_formperiodos'
    end

    def show_status
        puts current_user.id
        if Credenciamento.where(:iduser => current_user.id).exists?
            render 'credenciamento/show_credenciamento'
        end
    end

    def create_credenciamento
        Credenciamento.create(iduser: current_user.id)
        render 'credenciamento/success_createcredenciamento'
    end

    def create_periodocredenciamento
        Periodo_Credenciamento.create(comeco: params[:começo],fim: params[:fim],idadmin: current_user.id)
        render 'credenciamento/success_createperiodo'
    end

    def alter_credenciamento
        @credencial = Credenciamento.find(current_user.id)
        @credencial.aproved = false
        @credencial.rejected = false
        @credencial.save
        render 'credenciamento/success_altercredenciamento'
    end

    def show_pedidos
        render 'credenciamento/show_pedidos'
    end

    def aproved
        @credencial = Credenciamento.find(params[:id])
        @credencial.aproved = true
        @credencial.rejected = false
        @credencial.save
        render 'credenciamento/show_pedidos'
    end

    def rejected
        @credencial = Credenciamento.find(params[:id])
        @credencial.rejected = true
        @credencial.aproved = false
        @credencial.save
        render 'credenciamento/show_pedidos'
    end
end
