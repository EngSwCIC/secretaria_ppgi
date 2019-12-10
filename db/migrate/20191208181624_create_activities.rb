class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :date
      t.boolean :interesting, default: false
      t.boolean :interesting_filter, default: false
      t.integer :interested_users, array: true, default: []

      t.timestamps
    end
  end
end
