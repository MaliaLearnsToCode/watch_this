class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_watch, only: %i[show edit update destroy]

  def show
    authorize @watch
    @bookings = @watch.bookings
  end

  private

  def set_watch
    @watch = Watch.find(params[:id])
  end

end


# PSEUDOCODE
# No need for authorization to view details of the watch
# Shows all the information (brand, model, year, price per day, owner) of the watch
# shows different photos of the watch
# a reserve field with a button to reserve the watch, with the required dates, amount of days,
# reserve button redirects to confirmation page which is the bookings show (Danish)
