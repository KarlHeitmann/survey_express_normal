class DashboardController < ApplicationController
  def home
  end

  def change
    # render partial: 'vote', locals: { alternative: @alternative }
    render partial: 'c'
  end
end
