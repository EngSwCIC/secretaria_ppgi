class Requirement < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    has_many_attached :documents

    validate :check_role, on: [:create, :update]
    def check_role
        if Current.user.role != 'administrator'
            self.errors.add(:user_id, 'without permission')
            return false
        end
        true
    end

    before_destroy do
        throw(:abort) unless Current.user.role == 'administrator'
    end
end
