class Activity < ApplicationRecord
    has_one :status

    validates :name, :description, presence: true
    validates :role, presence: false
    validates :type_activity, presence: false

    enum type_activity: %i[trancamento_de_matrícula trancamento_de_semestre]
end
