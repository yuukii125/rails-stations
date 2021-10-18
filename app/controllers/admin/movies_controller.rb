class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to admin_movies_path, notice: "登録しました！"
    else
      flash.now[:danger] = "登録に失敗しました。"
      render action: :new
    end
  end

  private

  def movie_params
    params.permit(:name, :year, :description, :image_url, :is_showing)
  end

end
