##
# = Adicionando Tabela Users para usar no db:migrate

class AddInfoToUsers < ActiveRecord::Migration[5.2]
	# Informaçoes Para Adicao de novas colunas na Tabela
  def change #:nodoc:
    add_column :users, :full_name, :string
    add_column :users, :registration, :string
    add_column :users, :role, :integer
  end
end
