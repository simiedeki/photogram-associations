# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#

class FollowRequest < ApplicationRecord
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  validates :recipient_id, uniqueness: { scope: :sender_id }

  # Direct associations
  belongs_to :sender,
             class_name: 'User',
             foreign_key: 'sender_id'

  belongs_to :recipient,
             class_name: 'User',
             foreign_key: 'recipient_id'
end
