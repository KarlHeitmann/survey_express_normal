class SurveysController < ApplicationController
  before_action :set_room
  def new
    @survey = Survey.new

  end

  def show
  end

  def index
  end
  private

    def set_room
      @room = Room.find(params[:room_id])
    end
end
