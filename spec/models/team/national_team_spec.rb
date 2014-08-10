# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  squad_size    :integer
#  national_team :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#  type          :string(255)
#  world_ranking :integer
#

require 'rails_helper'

RSpec.describe Team::NationalTeam, :type => :model do
  it "is a national team" do
    team = create :england
    expect(team.national_team?).to be_truthy
  end
end
