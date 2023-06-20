class AddColumnsToTrades < ActiveRecord::Migration[7.0]
  def change
    change_column :trades, :entry_price, :decimal
    change_column :trades, :exit_price, :decimal
    change_column :trades, :coin_id, :string
    change_column :trades, :size, :decimal
  end
end
