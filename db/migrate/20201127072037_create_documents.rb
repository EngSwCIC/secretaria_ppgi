class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.binary :data
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
