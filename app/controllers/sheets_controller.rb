class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    # @reservation = Reservation.find(params[:])
  end

end
