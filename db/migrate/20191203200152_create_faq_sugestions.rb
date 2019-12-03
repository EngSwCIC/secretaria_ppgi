class CreateFaqSugestions < ActiveRecord::Migration[5.2]
  def change
    create_table :faq_sugestions do |t|
      t.text :topico
      t.text :pergunta
      t.text :resposta
      t.references :faq, foreign_key: true

      t.timestamps
    end
  end
end
