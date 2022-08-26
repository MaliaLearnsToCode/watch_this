class BookingsController < ApplicationController
  before_action :set_booking, only: %i[create show success]

  def new
    @bookings = Booking.new
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

  def edit
    @booking = Booking.find(params[:id])
  end

  def delete
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking.status("available"), status: :see_other
  end

  def success
    @watch = @booking.watch
    @success = @booking.watch
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:delivery, :cleaning_service)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
