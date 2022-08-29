class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show success]
  before_action :set_watch, only: %i[new create]


  def new
    @booking = Booking.new
    if params[:days].present?
      @days = params[:days].to_i
    end
    @user = @watch.user
    authorize @booking

    @start_date = params[:start_date].to_date
    @end_date = params[:end_date].to_date

    # @coordinates = Geocoder.coordinates(current_user.address)

    # @markers = {
    #   lat: @coordinates[0],
    #   lng: @coordinates[1]
    # }

    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.watch = @watch
    # @booking.total = @watch.price
    # @booking.start_date = @start_date
    # @booking.end_date = @end_date
    @markers = Geocoder.coordinates(current_user.address)


    authorize @booking

    if @booking.save
      redirect_to success_booking_path(@booking, @watch)
    else
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
    params.require(:booking).permit(:delivery, :cleaning_service, :start_date, :end_date, :total, :status, :delivery_location)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_watch
    @watch = Watch.find(params[:watch_id])
  end

end
