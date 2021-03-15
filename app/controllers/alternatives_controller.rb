class AlternativesController < ApplicationController
  def vote
    @alternative = Alternative.find(params[:id])
    @alternative.votes += 1
    @alternative.save
  end
end
