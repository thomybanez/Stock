class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.string :transaction_type
      t.decimal :amount
      t.integer :wallet_id
      
      t.timestamps
    end
  end
end
