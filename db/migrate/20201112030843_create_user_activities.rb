class CreateUserActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_activities do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :activity, foreign_key: true
      t.boolean :interested
      t.boolean :active
    end
    add_index :user_activities, %i[user_id activity_id], unique: true
  end
end
