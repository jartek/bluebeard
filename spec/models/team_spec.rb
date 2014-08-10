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

RSpec.describe Team, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
