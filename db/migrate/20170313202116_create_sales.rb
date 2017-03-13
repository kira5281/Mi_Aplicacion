class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :adviser_id
      t.string :name
      t.float :cant

      t.timestamps
    end
  end
end
