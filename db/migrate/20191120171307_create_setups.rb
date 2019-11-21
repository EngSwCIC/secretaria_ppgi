class CreateSetups < ActiveRecord::Migration[5.2]
  def change
    create_table :setups do |t|
      t.datetime :inicio
      t.datetime :fim

      t.timestamps
    end
  end
end
