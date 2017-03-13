class AddUserIdToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :user_id, :integer
    add_index :sales, :user_id
  end
end
