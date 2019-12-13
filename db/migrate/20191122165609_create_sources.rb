##
# = Criacao da Tabela Sources, onde ira ficar salva todas as fontes de informaçoes para usar no db:migrate

class CreateSources < ActiveRecord::Migration[5.2]
 # Informaçoes Para Criaçao da Tabela
  def change #:nodoc:
    create_table :sources do |t|
      t.string :title

      t.timestamps
    end
  end
end
