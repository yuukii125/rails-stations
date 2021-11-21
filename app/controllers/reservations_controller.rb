class ReservationsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @date = params[:date]
    @sheet = Sheet.find(params[:sheet_id])
    @reservation = Reservation.new
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @sheet = Sheet.find(params[:sheet_id])
    @date = params[:date]
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to movie_path(@movie.id), notice: "予約しました！"
    else
      flash.now[:danger] = "予約に失敗しました。"
      @movie
      @date
      @schedule
      @sheet
      render :new
    end
  end

  private

  def reservation_params
    params.permit(:date, :schedule_id, :sheet_id, :email, :name)
  end

end
