class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @date = params[:date]
    @movie = Movie.find(params[:movie_id])
  end

end
