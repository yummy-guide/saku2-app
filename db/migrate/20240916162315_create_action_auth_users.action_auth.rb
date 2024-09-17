# This migration comes from action_auth (originally 20231107165548)
class CreateActionAuthUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :verified

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
