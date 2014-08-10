# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  nick_name  :string(255)
#  type       :integer
#  created_at :datetime
#  updated_at :datetime
#

class Competition < ActiveRecord::Base
  TYPES = {
    'cup' => 1,
    'league' => 2
  }
end
