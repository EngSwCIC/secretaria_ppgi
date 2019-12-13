class ChangeNameStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :status, :estado
  end
end
