class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :request_type_id
      t.integer :user_id
      t.binary :documents

      t.timestamps
    end
  end
end
