class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.date :due_date
      # t.attachment :documents
      
      t.references :activity_type, foreign_key: true
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    create_table :users_activities do |t|
      t.references :user
      t.references :activity
    end

    add_index :users_activities, %i[user_id activity_id], unique: true
  end
end
