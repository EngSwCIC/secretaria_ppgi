class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.text :topico
      t.text :pergunta
      t.text :resposta

      t.timestamps
    end
  end
end
