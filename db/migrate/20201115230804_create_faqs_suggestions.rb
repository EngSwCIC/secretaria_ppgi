class CreateFaqsSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs_suggestions do |t|
      t.string :question
      t.string :answer
      t.string :tropicQuestion

      t.timestamps
    end
  end
end
