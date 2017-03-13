class CreateAdvisers < ActiveRecord::Migration[5.0]
  def change
    create_table :advisers do |t|
      t.string :name
      t.string :area
      t.string :sede

      t.timestamps
    end
  end
end
