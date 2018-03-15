class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :season
      t.integer :guaranteed_salary
      t.integer :salary
      t.boolean :player_option
      t.boolean :team_option
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
