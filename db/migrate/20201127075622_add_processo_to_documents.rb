class AddProcessoToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :processo_id, :integer
  end
end
