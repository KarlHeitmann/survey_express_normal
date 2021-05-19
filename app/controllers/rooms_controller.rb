class RoomsController < ApplicationController
  # Loads:
  # @rooms = all rooms
  # @room = current room when applicable
  before_action :load_entities

  def home
  end

  def index
    @rooms = Room.order(created_at: :desc)
    @users = User.all
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.order(created_at: :asc).includes(:user)
  end

  def chat
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end


  def new
    @room = Room.new
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def create
    @room = Room.new permitted_parameters

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
