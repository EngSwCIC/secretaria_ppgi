class TropicQuestion < ActiveRecord::Migration[5.2]
  def change
  create_table :tropicQuestions do |t|
      t.text :title

      t.timestamps
    end
  end
end
