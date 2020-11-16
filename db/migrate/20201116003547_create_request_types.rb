class CreateRequestTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :request_types do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end
end
