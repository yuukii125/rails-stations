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
    @movies = Movie.all
    @sheets = Sheet.all
    @schedule = @movies.first.schedules
  end

  def create
    @reservation = Reservation.create(admin_reservation_params)
    if @reservation.save
      redirect_to admin_reservations_path, notice: "作成しました！"
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @movies = Movie.all
    @movie = @reservation.schedule.movie
    @schedule = @reservation.schedule
    @sheet = @reservation.sheet
  end

  def update
    @reservation = Reservation.find(params[:id])
    if !@reservation.present?
      flash.now[:danger] = "編集もとの映画は存在しません"
    end
    if @reservation.update(admin_reservation_params)
      redirect_to admin_reservation_path, notice: "編集しました"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
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

  private

  def admin_reservation_params
    params.require(:reservation).permit(:date,
                                        :schedule_id,
                                        :sheet_id,
                                        :name,
                                        :email,
                                        movies_attributes: [:id, :name],
                                        schedule_attributes: [:id, :start_time, :end_time],
                                        sheet_attributes: [:id, :row, :column])
  end

end
