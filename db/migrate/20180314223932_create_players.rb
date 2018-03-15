class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.date :birth_date
      t.integer :experience
      t.integer :with_current_team
      t.string :slug
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
