class ReservationsController < ApplicationController
  before_action :set_movie, only: [:new, :create]

  def new
    unless params[:date].present? && params[:sheet_id].present?
      render status: 400
    end
    @reservation = Reservation.new
    @date = params[:date]
    @sheet = Sheet.find(params[:sheet_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    @reservation = Reservation.create(name: reservation_params[:name],
                                      email: reservation_params[:email],
                                      date: reservation_params[:date],
                                      sheet_id: reservation_params[:sheet_id],
                                      schedule_id: reservation_params[:schedule_id])
    if @reservation.save
      redirect_to movie_path(@movie.id), notice: "予約しました！"
    else
      # redirect_to new_movie_schedule_reservation_path(movie_id: params[:movie_id],
      #                                                 date: params[:date],
      #                                                 sheet_id: params[:sheet_id],
      #                                                 schedule_id: params[:schedule_id]),
      #                                                 alert: "名前またはメールアドレスを記入してください"
      redirect_to movie_schedule_sheets_path(movie_id: reservation_params[:movie_id],
                                            date: reservation_params[:date],
                                            schedule_id: reservation_params[:schedule_id]),
                                            alert: "名前またはメールアドレスを記入してください"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name, :movie_id)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
