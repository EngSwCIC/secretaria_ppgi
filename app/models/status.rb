##
# Essa classe representa os múltiplos estados cujo processo pode estar
# classificado.

class Status < ApplicationRecord
    ##
    # O único atributo que a compõe é name, que é um dos possíveis estados
    # que um processo pode pertencer.

    belongs_to :activities 

    validates :name, presence: true

end
