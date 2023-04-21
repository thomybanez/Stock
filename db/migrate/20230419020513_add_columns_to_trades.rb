class AddColumnsToTrades < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :entry_price, :decimal
    add_column :trades, :exit_price, :decimal
    add_column :trades, :coin_id, :string
    add_column :trades, :size, :decimal
  end
end
