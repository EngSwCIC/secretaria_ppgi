class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :date
      t.boolean :interesting, default: false

      t.timestamps
    end
  end
end
