class Admin::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :schedule_check, only: [:create, :update]
  before_action :sheet_check, only: [:create, :update]
  def index
    @reservations = Reservation.all
  end

  def show
      @movie = @reservation.schedule.movie
      @sheet = @reservation.sheet
      @schedule = @reservation.schedule
  end

  def new
    @reservation = Reservation.new
    @movies = Movie.all
    @sheets = Sheet.all
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
    @movies = Movie.all
    @movie = @reservation.schedule.movie
    @schedule = @reservation.schedule
    @sheet = @reservation.sheet
  end

  def update
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
    if @reservation.destroy
      redirect_to admin_reservations_path, notice: "削除しました！"
    else
      flash.now[:danger] = "削除に失敗しました。"
      render :edit
    end
  end

  private

  def set_reservation
    if Reservation.exists?(params[:id])
      @reservation = Reservation.find(params[:id])
    else
      redirect_to admin_reservations_path, notice: "指定されたIDは存在しません"
    end
  end

  def admin_reservation_params
    params.require(:reservation).permit(:date,
                                        :schedule_id,
                                        :sheet_id,
                                        :name,
                                        :email,
                                        movies_attributes: [:id, :name],
                                        schedules_attributes: [:id, :start_time, :end_time],
                                        sheets_attributes: [:id, :row, :column])
    end

    def schedule_check
      unless Schedule.exists?(params[:reservation][:schedules][:schedule_id])
        redirect_to admin_reservations_path, notice: "指定したスケジュールは存在しません"
      end
    end

    def sheet_check
      unless Sheet.exists?(params[:reservation][:sheets][:sheet_id])
        redirect_to admin_reservations_path, notice: "指定した座席は存在しません"
      end
    end

  end
