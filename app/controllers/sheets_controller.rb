class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @date = params[:date]
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:start_time])
    # @schedule = Schedule.find(params[:schedule_id])
  end

end
