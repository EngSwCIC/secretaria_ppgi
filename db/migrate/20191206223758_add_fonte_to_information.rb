class AddFonteToInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :information, :fonte, :string
  end
end
