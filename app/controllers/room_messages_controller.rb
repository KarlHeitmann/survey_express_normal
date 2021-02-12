class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    ap "WENA AAAAA AAAA AAA 0000000000000"

    ap @room
    ap ":::::::::::::::::::::::::::::::::"
    ap @room_message
    ap RoomChannel
    RoomChannel.broadcast_to @room, @room_message
    # begin
    #   RoomChannel.broadcast_to @room, @room_message
    # rescue Exception => e
    #   ap e.message
    #   ap e.backtrace.inspect
    # end
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
