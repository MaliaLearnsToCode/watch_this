class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def show
    authorize @booking
    @watch = @booking.watch
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

end
