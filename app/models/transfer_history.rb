# == Schema Information
#
# Table name: transfer_histories
#
#  transfer_date :date
#  player_id     :integer
#  from          :integer
#  to            :integer
#  cost          :integer
#  loan          :boolean
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_transfer_histories_on_from       (from)
#  index_transfer_histories_on_player_id  (player_id)
#  index_transfer_histories_on_to         (to)
#

class TransferHistory < ActiveRecord::Base
end
