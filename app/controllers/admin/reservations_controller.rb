class Admin::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :set_today

  def index
    @reservations = Reservation.all.page(params[:page]).per(10)
  end

  def show
      @movie = @reservation.schedule.movie
      @sheet = @reservation.sheet
      @schedule = @reservation.schedule
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(admin_reservation_params)

    if Reservation.exists?(schedule_id: params[:reservation][:schedule_id], sheet_id: params[:reservation][:sheet_id])
      flash.now[:danger] = "すでに予約が入っています"
      render :new
    elsif @reservation.save
      redirect_to admin_reservations_path, notice: "作成しました！"
    else
      flash.now[:danger] = "入力されていない項目があります"
      render :new
    end
  end

  def edit
    if @movie = @reservation.schedule.movie
      @schedules = @reservation.schedule
      @sheets = @reservation.sheet
    else
      redirect_to admin_reservations_path, notice: "指定された映画は存在しません"
    end
  end

  def update
    @movie = @reservation.schedule.movie
    if !@reservation.present? || !Schedule.exists?(params[:reservation][:schedule_id]) || !Sheet.exists?(params[:reservation][:sheet_id])
      flash.now[:danger] = "編集もとの映画、またはスケジュール、座席は存在しません"
      render :edit
    elsif @reservation.update(admin_reservation_params)
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
    @reservation = Reservation.find(params[:id])
  end

  def admin_reservation_params
    params.require(:reservation).permit(:date,
                                        :schedule_id,
                                        :sheet_id,
                                        :name,
                                        :email,
                                        schedules_attributes: [:id, :movie_id, :start_time],)
    end

    def set_today
      @today = Time.current
    end
  end
