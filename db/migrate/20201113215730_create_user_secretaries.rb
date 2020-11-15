class CreateUserSecretaries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_secretaries do |t|
      t.integer :id
      t.string :full_name
      t.string :email
      t.string :password
      t.integer :role
      t.string :registration_numer

      t.timestamps
    end
  end
end
