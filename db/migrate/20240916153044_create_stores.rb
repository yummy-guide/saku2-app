class CreateStores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
