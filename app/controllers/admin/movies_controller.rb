class Admin::MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update]

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
      render :new
    end
  end
  
  def edit
    # @movie = Movie.find(params[:id])
  end
    
  def update
    # @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = '編集しました'
      redirect_to admin_movies_path
    else
      flash.now[:danger] = "編集に失敗しました。"
      render :edit
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end

  def set_movie
    unless @movie = Movie.find_by(id: params[:id])
      redirect_to admin_movies_path, notice: "該当のユーザーは存在しません"
    end
  end
end
