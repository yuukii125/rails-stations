class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    # @reservation = Reservation.find(schedule_id: params[:schedule])
  end

end
