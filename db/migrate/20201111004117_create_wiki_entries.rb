class CreateWikiEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :wiki_entries do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
