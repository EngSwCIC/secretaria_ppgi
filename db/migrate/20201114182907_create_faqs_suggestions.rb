class CreateFaqsSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs_suggestions do |t|
      t.string :question
      t.string :answer
      t.references :tropicQuestion, foreign_key: true

      t.timestamps
    end
  end
end
