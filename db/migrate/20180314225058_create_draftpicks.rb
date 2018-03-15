class CreateDraftpicks < ActiveRecord::Migration[5.1]
  def change
    create_table :draftpicks do |t|
      t.integer :year
      t.references :team, foreign_key: true
      t.integer :original_team
      t.integer :round

      t.timestamps
    end
  end
end
