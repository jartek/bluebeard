# == Schema Information
#
# Table name: stadia
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  capacity        :integer
#  year_built      :integer
#  corporate_boxes :integer
#  turf_heating    :boolean          default(FALSE)
#  running_track   :boolean          default(FALSE)
#  width           :integer
#  height          :integer
#  surface         :string(255)
#  address         :string(255)      is an Array
#  created_at      :datetime
#  updated_at      :datetime
#

class Stadium < ActiveRecord::Base
  validates :name, :capacity, :year_built, :width, :height, :surface, :address, presence: true
end
