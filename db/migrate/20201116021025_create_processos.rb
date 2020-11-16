class CreateProcessos < ActiveRecord::Migration[5.2]
  def change
    create_table :processos do |t|
      t.integer :user_id
      t.integer :process_status_id
      t.string :sei_process_code
      t.binary :documents

      t.timestamps
    end
  end
end
