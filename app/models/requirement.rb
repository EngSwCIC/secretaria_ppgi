##
# Model de Requirement.
# Pede para que o titulo seja unico, e necessariamente preenchido
# indica que um único requisito pode ter também diversos documentos anexados
class Requirement < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many_attached :documents

    ##
    # Define se usuário atual está logado e se é administrador do sistema
    validate :check_role, on: [:create, :update]
    def current_user_is_admin
        Current.user != nil && Current.user.role == 'administrator'
    end

    ##
    # Permite criação ou atualização de requisitos por um administrador
    def check_role
        unless current_user_is_admin
            self.errors.add(:base, 'Usuário sem permissão')
            return false
        end
        true
    end

    ##
    # Indica se o usuário tem permissão para apagar
    before_destroy :check_permission
    # Habilita deleção (usado por 'db/seeds.rb')
    def allow_deletion!
        @allow_deletion = true
    end

    ##
    # Permite deleção de requisitos por um administrador ou caso metodo 'allow_deletion!' tenha sido chamado pela instancia
    def check_permission
        unless @allow_deletion || current_user_is_admin
            throw(:abort)
        end
    end
end
