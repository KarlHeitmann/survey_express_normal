class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy,
                         inverse_of: :room
  has_many :surveys, dependent: :destroy


end
