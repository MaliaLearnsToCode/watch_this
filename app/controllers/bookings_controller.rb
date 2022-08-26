class BookingsController < ApplicationController

  def new
    @watch = Watch.find(params[:watch_id])
    @user = @watch.user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @watch = Watch.find(params[:watch_id])
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.watch = @watch
    @booking.total = @watch.price
    @booking.start_date = @watch.start_date
    @booking.end_date = @watch.end_date
    authorize @booking

    if @booking.save
      redirect_to success_booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:delivery, :cleaning_service)
  end

end
