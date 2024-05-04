# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#

class Like < ApplicationRecord
  validates(:fan, { :presence => true })
  validates(:photo, { :presence => true })
  validates(:photo_id, { 
    :uniqueness => { :scope => [:fan_id] }
  })

   validates :fan_id, presence: true   # Validate presence of fan_id instead of fan
  validates :photo_id, presence: true # Validate presence of photo_id instead of photo
  validates :photo_id, uniqueness: { scope: :fan_id } # Ensure a fan can only like a photo once

  # Direct associations
  belongs_to :fan,
             class_name: 'User',
             foreign_key: 'fan_id'

belongs_to :photo, class_name: 'Photo', foreign_key: 'photo_id'
end
