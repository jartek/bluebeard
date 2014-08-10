class RemoveCompetitionIdFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :competition_id
  end
end
