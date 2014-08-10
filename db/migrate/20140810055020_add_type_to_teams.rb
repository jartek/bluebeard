class AddTypeToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :type, :string
  end
end
