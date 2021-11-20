class MoviesController < ApplicationController
  before_action :set_today
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
    # if @schedules.exists?
    #   @schedule = @schedules.find(movie_id: params[:id])
    # end
  end

  private

  def set_today
    @today = Time.current
  end
end
