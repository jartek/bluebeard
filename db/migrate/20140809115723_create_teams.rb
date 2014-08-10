class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :squad_size
      t.integer :competition_id
      t.boolean :national_team, default: false
      t.timestamps
      t.index :competition_id
    end
  end
end
