class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.integer :user_id
      t.string :coin_id
      t.decimal :quantity
      t.decimal :average_entry

      t.timestamps
    end
  end
end
