class Activity < ApplicationRecord
    belongs_to: Status

    validates :name, presence: true
    validates :description, presence: true
    validates :type_activity, presence: false

    enum type_activity: %i[trancamento_de_matrícula trancamento_de_semestre]
end
