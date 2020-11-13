class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.text :Topic
      t.text :Question
      t.text :Answer

      t.timestamps
    end
  end
end
