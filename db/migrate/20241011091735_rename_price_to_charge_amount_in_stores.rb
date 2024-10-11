class RenamePriceToChargeAmountInStores < ActiveRecord::Migration[8.0]
  def change
    rename_column :stores, :price, :charge_amount
  end
end
