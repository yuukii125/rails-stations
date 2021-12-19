class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where("date >= ?", Date.today).order(:id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end


end
