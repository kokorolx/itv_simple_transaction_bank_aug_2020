class AddDeletedAtToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :deleted_at, :timestamp
  end
end
