class AddDiscountAmountToCoupons < ActiveRecord::Migration[8.0]
  def change
    add_column :coupons, :discount_amount, :decimal, null: false
  end
end
