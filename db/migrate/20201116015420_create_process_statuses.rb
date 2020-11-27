class CreateProcessStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :process_statuses do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
