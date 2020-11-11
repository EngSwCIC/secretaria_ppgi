class Activity < ApplicationRecord
    validates :title, presence: { message: "O Nome da atividade deve ser informado." }
    validates :due_date, presence: { message: "O Prazo de execução da atividade deve ser informado." }
end
