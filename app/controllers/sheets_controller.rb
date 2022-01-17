class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @date = params[:date]
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @screen = Screen.find_by(movie_id: params[:movie_id])
    unless @date.present? && @schedule.present?
      redirect_to movie_path(@movie.id), alert: "日付と時刻を選択してください"
    end
  end

end
