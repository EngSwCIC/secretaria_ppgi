class Requirement < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many_attached :documents

    validate :check_role, on: [:create, :update]
    def current_user_is_admin
        # Valida se o usuário possui permissão
        Current.user != nil && Current.user.role == 'administrator'
    end
    def check_role
        # Valida se o usuário possui permissão
        unless current_user_is_admin
            self.errors.add(:base, 'Usuário sem permissão')
            return false
        end
        true
    end

    before_destroy :check_permission
    def allow_deletion!
        @allow_deletion = true
    end
    def check_permission
        unless @allow_deletion || current_user_is_admin
            throw(:abort)
        end
    end
end
