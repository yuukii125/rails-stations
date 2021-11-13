class Admin::SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.includes(:movie)
  end

  def new
    @schedule = Schedule.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    movie = Movie.find(params[:schedule][:movie_id])
    @schedule = movie.schedules.create(schedule_params)
    if @schedule.save
      redirect_to admin_movie_path(@schedule.movie_id), notice: "登録しました！"
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if !@schedule.present?
      flash.now[:danger] = "編集元の映画は存在しません。"
      render :index
    end
    if @schedule.update(schedule_params)
      redirect_to admin_movie_path(@schedule.movie_id), notice: "編集しました！"
    else
      flash.now[:danger] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      redirect_to admin_movie_path(@schedule.movie_id), notice: "削除しました！"
    else
      flash.now[:danger] = "削除に失敗しました。"
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:movie_id, :start_time, :end_time)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
