class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :nick_name
      t.integer :type
      t.timestamps
    end
  end
end
