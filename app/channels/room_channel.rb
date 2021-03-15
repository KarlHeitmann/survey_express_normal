class RoomChannel < ApplicationCable::Channel
  def subscribed
    ap "SUBSCRIBED 1"
    room = Room.find params[:room]
    ap "SUBSCRIBED 2"
    ap room
    stream_for room

    # or
    # stream_from "room_#{params[:room]}"
  end
end
