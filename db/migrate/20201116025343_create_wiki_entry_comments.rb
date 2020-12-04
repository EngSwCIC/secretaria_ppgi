class CreateWikiEntryComments < ActiveRecord::Migration[5.2]
  def change
    create_table :wiki_entry_comments do |t|
      t.integer :wiki_entry_id
      t.text :content

      t.timestamps
    end
  end
end
