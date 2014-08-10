class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name
      t.integer :capacity
      t.integer :year_built
      t.integer :corporate_boxes
      t.boolean :turf_heating, default: false
      t.boolean :running_track, default: false
      t.integer :width
      t.integer :height
      t.string :surface
      t.string :address, array: true
      t.timestamps
    end
  end
end
