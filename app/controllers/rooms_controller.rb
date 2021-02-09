class RoomsController < ApplicationController
  def home
  end

  def index
    @rooms = Room.all
  end
end
