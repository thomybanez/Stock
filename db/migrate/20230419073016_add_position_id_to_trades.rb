class AddPositionIdToTrades < ActiveRecord::Migration[7.0]
  def change
    add_reference :trades, :position, null: false, foreign_key: true
  end
end
