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

class Team::NationalTeam < Team
  has_many :players

  before_create :set_national_team

  private

  def set_national_team
    self.national_team = true
  end
end
