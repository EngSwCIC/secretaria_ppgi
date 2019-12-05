class Activity < ApplicationRecord
    belongs_to: Status

    validates :name, :description, presence: true

    enum type_activity: %i[trancamento_de_matrícula trancamento_de_semestre]
end
