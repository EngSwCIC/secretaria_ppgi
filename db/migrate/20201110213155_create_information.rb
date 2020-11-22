class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :title
      t.text :content
      t.integer :source_id
      t.integer :published_by
      t.timestamps
    end
  end
end
