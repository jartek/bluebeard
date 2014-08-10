class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :competition_id
      t.datetime :date
      t.timestamps
      t.index :home_team_id
      t.index :away_team_id
      t.index :competition_id
    end
  end
end
