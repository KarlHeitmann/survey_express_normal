class AlternativesController < ApplicationController
  before_action :set_room
  def vote
    @alternative = Alternative.find(params[:id])
    @alternative.votes += 1
    @alternative.save
  end

  def add
    @survey = Survey.find(params[:survey_id])
    @alternative = @survey.alternatives.build(alternative_params)
    if @alternative.save
      puts "Guardado"
      redirect_to room_surveys_path(@room)
    else
      puts "Oh oh"
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def alternative_params
      params.require(:alternative).permit(:name)
    end
end
