class AddIsOngoingColumnToTrades < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :is_ongoing, :boolean, default: true
  end
end
