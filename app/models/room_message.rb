class RoomMessage < ApplicationRecord
  belongs_to :room
  belongs_to :user, inverse_of: :room_messages

  after_create_commit :broadcast_to_room

  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end

  private

    def broadcast_to_room
      room = self.room
      # broadcast_append_to "#{room.id}"
      broadcast_append_to "room#{room.id}"
    end

end
