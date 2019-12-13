class ChangeRole < ActiveRecord::Migration[5.2]
  def change
    change_column_default :activities, :role, "Em espera"
  end
end
