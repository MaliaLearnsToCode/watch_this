class BookingsController < ApplicationController
  before_action :set_booking, only: %i[new show success]

  def success
    @watch = @booking.watch
    @success = @booking.watch
    authorize @booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
