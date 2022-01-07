class Admin::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

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
    # sheet = @reservation.build_sheet
    # sheet.schedules.build
    # sheet.movies.build
    @movies = Movie.all
    @sheets = Sheet.all
  end

  def create
    @reservation = Reservation.create(admin_reservation_params)

    if Movie.exists?(params[:reservation][:movies][:id])
      @movie = Movie.find(params[:reservation][:movies][:id])
    else
      redirect_to admin_reservations_path, notice: "指定された映画は存在しません"
    end

    if @reservation.save && @movie.save
      redirect_to admin_reservations_path, notice: "作成しました！"
    else
      render :new, alert: "すべての項目を入力してください"
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
    # if @reservation.update(admin_reservation_params) && @movie.update(admin_reservation_params[:reservation][:movies][:id])
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
                                        schedules_attributes: [:id, :start_time, :end_time],)
    end
  end
