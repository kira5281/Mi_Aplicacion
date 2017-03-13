class AddUserIdToAdvisers < ActiveRecord::Migration[5.0]
  def change
    add_column :advisers, :user_id, :integer
    add_index :advisers, :user_id
  end
end
