class BookingsController < ApplicationController

  def new
    @bookings = Booking.new
  end


end
