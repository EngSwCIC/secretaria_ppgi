class AddTypeActivityToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :type_activity, :string
  end
end
