class RenameAmountToSeatsInCoupons < ActiveRecord::Migration[8.0]
  def change
    rename_column :coupons, :amount, :seats
  end
end
