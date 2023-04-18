class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.decimal :balance, default: 0
      t.integer :user_id
      t.string :transaction_type
      t.timestamps
    end
  end
end
