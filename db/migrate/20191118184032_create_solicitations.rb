class CreateSolicitations < ActiveRecord::Migration[5.2]

  def change

    create_table :solicitations do |t|
      t.integer :kind
      t.date :departure
      t.date :return
      t.string :origin
      t.string :destination
      t.text :description
      t.integer :status, default: 1
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
