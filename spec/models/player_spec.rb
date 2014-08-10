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

require 'rails_helper'

RSpec.describe Player, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
