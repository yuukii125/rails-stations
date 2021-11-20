class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      # redirect_to movie_path(@reservation.movie_id), notice: "予約しました！"
      redirect_to movie_path, notice: "予約しました！"
    else
      flash.now[:danger] = "予約に失敗しました。"
      render :new
    end
  end

  private

  def reservation_params
    params.permit(:date, :schedule_id, :sheet_id, :email, :name)
    # params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end

end
