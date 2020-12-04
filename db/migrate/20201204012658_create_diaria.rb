class CreateDiaria < ActiveRecord::Migration[5.2]
  def change
    create_table :diaria do |t|
      t.string :data_entrada
      t.string :data_saida

      t.timestamps
    end
  end
end
