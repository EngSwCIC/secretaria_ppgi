class CreateAccreditations < ActiveRecord::Migration[5.2]
  def change
    create_table :accreditations do |t|
      t.belongs_to :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :sei_process, foreign_key: true

      t.timestamps
    end
  end
end
