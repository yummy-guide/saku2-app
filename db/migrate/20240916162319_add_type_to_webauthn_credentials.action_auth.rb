# This migration comes from action_auth (originally 20240818032321)
class AddTypeToWebauthnCredentials < ActiveRecord::Migration[7.2]
  def change
    add_column :webauthn_credentials, :key_type, :integer, default: 0, limit: 2
  end
end
