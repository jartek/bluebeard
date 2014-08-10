class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :full_name
      t.integer :squad_number
      t.integer :club_team_id
      t.date :date_of_birth
      t.string :birthplace
      t.integer :height
      t.integer :foot
      t.integer :national_team_id
      t.integer :secondary_national_team_id
      t.string :main_position
      t.string :secondary_position, array: true
      t.timestamps
      t.index :club_team_id
      t.index :national_team_id
      t.index :secondary_national_team_id
      t.index :secondary_position, using: 'gin'
    end
  end
end
