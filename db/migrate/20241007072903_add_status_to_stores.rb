class AddStatusToStores < ActiveRecord::Migration[8.0]
  def change
    add_column :stores, :status, :string
  end
end
