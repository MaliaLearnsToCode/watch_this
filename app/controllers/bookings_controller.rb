class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show success]
  before_action :set_watch, only: %i[new create]


  def new
    @booking = Booking.new
    @user = @watch.user
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.watch = @watch
    @booking.total = @watch.price

    authorize @booking

    if @booking.save
      p "Test TEST TEST TEST"
      redirect_to success_booking_path(@booking)
    else
      p "SOMETHING ELSE"
      render :new, status: :unprocessable_entity
    end
  end

  def success
    @watch = @booking.watch
    @success = @booking.watch
    authorize @booking
  end

  def update
    raise
  end


  private

  def booking_params
    params.require(:booking).permit(:delivery, :cleaning_service, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_watch
    @watch = Watch.find(params[:watch_id])
  end

end
