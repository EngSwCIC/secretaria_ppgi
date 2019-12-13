##
# = Adicionando uma coluna a mais na tabela Information para usar no db:migrate

class AddFonteToInformation < ActiveRecord::Migration[5.2]
  
  def change #:nodoc:
    add_column :information, :fonte, :string
  end
end
