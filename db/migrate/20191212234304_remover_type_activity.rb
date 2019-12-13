class RemoverTypeActivity < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :type_activity
  end
end
