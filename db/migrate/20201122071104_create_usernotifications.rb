class CreateUsernotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :usernotifications do |t|
      t.integer :user_id
      t.integer :notification_id
    end
  end
end
