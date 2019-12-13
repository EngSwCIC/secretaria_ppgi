class ChangeNameRole < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :role, :status
  end
end
