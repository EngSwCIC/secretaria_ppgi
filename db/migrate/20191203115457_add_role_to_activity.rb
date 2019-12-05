class AddRoleToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :role, :string
  end
end
