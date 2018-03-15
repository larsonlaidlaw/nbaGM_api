class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.boolean :no_trade
      t.boolean :active
      t.boolean :trade_kicker
      t.boolean :two_way
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
