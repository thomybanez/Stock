class AddDefaultValueToSize < ActiveRecord::Migration[7.0]
  def change
    change_column :trades, :size, :decimal, default: 0
  end
end
