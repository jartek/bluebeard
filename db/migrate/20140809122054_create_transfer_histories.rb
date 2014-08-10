class CreateTransferHistories < ActiveRecord::Migration
  def change
    create_table :transfer_histories, id: false do |t|
      t.date :transfer_date
      t.integer :player_id
      t.index :player_id
      t.integer :from
      t.index :from
      t.integer :to
      t.index :to
      t.integer :cost, limit: 8
      t.boolean :loan
      t.timestamps
    end
  end
end
