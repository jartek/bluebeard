class AddWorldRankingToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :world_ranking, :integer
  end
end
