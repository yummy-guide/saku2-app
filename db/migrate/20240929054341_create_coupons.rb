class CreateCoupons < ActiveRecord::Migration[7.2]
  def change
    create_table :coupons do |t|
      t.references :store, null: false, foreign_key: true
      t.integer :amount
      t.boolean :active

      t.timestamps
    end
  end
end
