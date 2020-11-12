class CreateWikiComments < ActiveRecord::Migration[5.2]
  def change
    create_table :wiki_comments do |t|
      t.references :wiki_entry
      t.text :content

      t.timestamps
    end
  end
end
