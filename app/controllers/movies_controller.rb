class MoviesController < ApplicationController
  before_action :set_today
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
    if @schedules.present?
      @schedule = @schedules[0]
    else
      @schedule = false
    end
  end

  private

  def set_today
    @today = Time.current
  end
end
