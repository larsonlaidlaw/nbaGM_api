class CreateDeadSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :dead_seasons do |t|
      t.string :season
      t.integer :cap_hit
      t.references :player, foreign_key: true
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
