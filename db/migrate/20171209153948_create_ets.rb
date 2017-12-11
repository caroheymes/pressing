class CreateEts < ActiveRecord::Migration[5.0]
  def change
    create_table :ets do |t|
      t.string :name
      t.string :adresse
      t.integer :zip
      t.string :city
      t.string :string
      t.string :phone
      t.string :email
      t.float :chemise
      t.float :cinqchemise

      t.timestamps
    end
  end
end
