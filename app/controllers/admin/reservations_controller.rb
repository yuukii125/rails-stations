class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where("date >= ?", Date.today).order(:id)
  end
end
