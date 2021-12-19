class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where("date >= ?", Date.today).order(:id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @movie = @reservation.schedule.movie
    @sheet = @reservation.sheet
    @schedule = @reservation.schedule
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to admin_reservations_path, notice: "削除しました！"
    else
      flash.now[:danger] = "削除に失敗しました。"
      render :edit
    end
  end

end
