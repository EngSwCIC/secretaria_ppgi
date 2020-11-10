class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.binary :documents

      t.timestamps
    end
  end
end
