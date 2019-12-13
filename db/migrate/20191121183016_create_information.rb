##
# = Criacao da Tabela Information onde ira ficar salva todas as informaçoes cadastradas para usar no db:migrate

class CreateInformation < ActiveRecord::Migration[5.2]
  # Informaçoes Para Criaçao da Tabela
  def change #:nodoc:
    create_table :information do |t|
      t.string :title
      t.text :info

      t.timestamps
    end
  end
end
