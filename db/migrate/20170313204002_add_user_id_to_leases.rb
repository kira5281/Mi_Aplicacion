class AddUserIdToLeases < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :user_id, :integer
    add_index :leases, :user_id
  end
end
