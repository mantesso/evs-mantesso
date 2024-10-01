class CreatePotatoTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :potato_trades do |t|
      t.datetime :time
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
