##
# Essa classe representa o processo que alunos e professores podem
# requisitar, e que secretários podem editar.

class Activity < ApplicationRecord
    ##
    # Os atributos que a compõe são name, que representa o nome daquele
    # que requisita o processo, description, que é contém informações
    # cujo usuário considere relevante para seu processo, e estado,
    # o qual representa o possível status que o processo pode estar naquele
    # momento.

    has_one :status

    validates :name, presence: true
    validates :description, presence: true
    validates :estado, presence: true
end
