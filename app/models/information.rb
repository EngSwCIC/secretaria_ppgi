##
 # Model da classe information.
 # Exige que o conteúdo do corpo da informação seja único.
 # Exige que a informação tenha título e corpo
class Information < ApplicationRecord
    validates :content, uniqueness: true
    validates_presence_of :title, :content, :source_id

    ##
     # Método que faz a filtragem da informação por fonte
     # Recebe como argumento o nome de uma fonte de informação.
     # Então realiza uma consulta no banco de dados passando o nome da fonte recebida
     # Retorna o resultado dessa consulta.
     # Não redireciona o usuário
    def self.search(search)
        where("cast (source_id as text) LIKE ?","%#{search}")
    end
end
