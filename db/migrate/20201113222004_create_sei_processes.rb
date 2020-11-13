class CreateSeiProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :sei_processes do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :status
      t.string :code

      t.timestamps
    end
  end
end
