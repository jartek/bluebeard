# == Schema Information
#
# Table name: fixtures
#
#  id             :integer          not null, primary key
#  home_team_id   :integer
#  away_team_id   :integer
#  competition_id :integer
#  date           :datetime
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_fixtures_on_away_team_id    (away_team_id)
#  index_fixtures_on_competition_id  (competition_id)
#  index_fixtures_on_home_team_id    (home_team_id)
#

require 'rails_helper'

RSpec.describe Fixture, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
