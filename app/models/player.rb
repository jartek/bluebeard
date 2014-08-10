# == Schema Information
#
# Table name: players
#
#  id                         :integer          not null, primary key
#  full_name                  :string(255)
#  squad_number               :integer
#  club_team_id               :integer
#  date_of_birth              :date
#  birthplace                 :string(255)
#  height                     :integer
#  foot                       :integer
#  national_team_id           :integer
#  secondary_national_team_id :integer
#  main_position              :string(255)
#  secondary_position         :string(255)      is an Array
#  created_at                 :datetime
#  updated_at                 :datetime
#
# Indexes
#
#  index_players_on_club_team_id                (club_team_id)
#  index_players_on_national_team_id            (national_team_id)
#  index_players_on_secondary_national_team_id  (secondary_national_team_id)
#  index_players_on_secondary_position          (secondary_position)
#

class Player < ActiveRecord::Base

  validates :full_name, :date_of_birth, :birthplace, :height, :foot, :main_position, presence: true

  belongs_to :club_team, class: 'Team::ClubTeam'
  belongs_to :national_team, class: 'Team::NationalTeam'
  belongs_to :secondary_national_team, class: 'Team::NationalTeam'

  FOOT = {
    'left' => 1,
    'right' => 2,
    'both' => 3
  }
end
