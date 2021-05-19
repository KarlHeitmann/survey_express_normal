class RoomMessagesController < ApplicationController
  before_action :load_entities, only: [:create]

  def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    RoomChannel.broadcast_to @room, @room_message
    # begin
    #   RoomChannel.broadcast_to @room, @room_message
    # rescue Exception => e
    #   ap e.message
    #   ap e.backtrace.inspect
    # end
  end

  def update
    @room_message = RoomMessage.find(params[:id])
    if current_user.admin
      if @room_message.update(room_message_params)
        flash[:success] = "Room #{@room.name} was updated successfully"
        redirect_to rooms_path
      else
        render :new
      end
    else
      flash[:danger] = "You can't perform this action"
      redirect_to @room_message.room
    end
  end

  def toggle_like 
    @room_message = RoomMessage.find(params[:id])
    @room_message.toggle(:favourite)
    @room_message.save
    RoomChannel.broadcast_to @room_message.room, @room_message
    redirect_to @room_message.room
  end
  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

  def room_message_params
    params.require(:room_message).permit(:readed)
  end
end
