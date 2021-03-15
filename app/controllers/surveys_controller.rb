class SurveysController < ApplicationController
  before_action :set_room
  def new
    @survey = Survey.new
    # @group.crews.build
    @survey.alternatives.build
  end

  def show
  end

  def index
  end

  def create
    @survey = @room.surveys.build(survey_params)
    if @survey.save
      puts "GUARDADO"
      redirect_to room_surveys_path(@room)
    else
      puts "RENDER"
      ap @survey
      # ap @survey.errors
      render :new
    end
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def survey_params
      params.require(:survey).permit(:name, alternatives_attributes: [:name])
    end
end
