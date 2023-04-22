class CreateTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trades do |t|
	t.decimal :entry_price
	t.decimal :exit_price
	t.string :coin_id
	t.decimal :size, default:0
	t.boolean :is_going, default:true

	t.decimal :quantity
	t.decimal :average_entry


	size:decimal,default:0
	is_going:boolean,default:true
	

	def change
    		add_reference :trades, :user, null: true, foreign_key:true
  	end

	def change
		add_reference :trades, :position, null: false, foreign_key: true
	end

      t.timestamps
    end
  end
end
