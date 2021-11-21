class ReservationsController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @date = params[:date]
    @sheet = Sheet.find(params[:sheet_id])
    @reservation = Reservation.new
    @schedule = Schedule.find(params[:schedule_id])

    if (@date.nil?) || (@sheet.nil?)
      render "sheets/index"
    end

  end

  def create
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:schedule_id])
    @sheet = Sheet.find(params[:sheet_id])
    @date = params[:date]
    @reservation = Reservation.new(name: reservation_params[:name], email: reservation_params[:email], date: reservation_params[:date], sheet_id: reservation_params[:sheet_id], schedule_id: reservation_params[:schedule_id])
    @sheets = Sheet.all
    @already_reservation = Reservation.find_by(date: params[:date], schedule_id: params[:schedule_id], sheet_id: params[:sheet_id])

    if !@already_reservation.nil?
      flash.now[:danger] = "その座席はすでに予約済です。"
      @movie
      @date
      @schedule
      @sheets
      render "sheets/index"
    elsif @reservation.save
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
    params.permit(:date, :schedule_id, :sheet_id, :email, :name, :movie_id)
  end

end
