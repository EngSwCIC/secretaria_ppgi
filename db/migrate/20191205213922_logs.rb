class Logs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.decimal :value
      t.text :description
      t.references :budget, foreign_key: true
      t.timestamps
    end
  end
end
