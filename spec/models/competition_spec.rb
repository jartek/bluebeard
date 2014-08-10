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

require 'rails_helper'

RSpec.describe Competition, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
