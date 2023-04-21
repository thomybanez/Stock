class AddPositionIdToTrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :trades, :position, foreign_key: true, null: false, default: 1
  end
end
