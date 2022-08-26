class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_watch, only: %i[show edit update destroy]

  def index
    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date
      @watches = Watch.within_date(start_date, end_date)
      @watches = policy_scope(Watch.within_date(start_date, end_date))
    else
      @watches = Watch.all
      @watches = policy_scope(Watch)
    end

  end

  def show
    authorize @watch
    @bookings = @watch.bookings
  end

  def new
    @watch = Watch.new
    authorize @watch
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user # when in view: we can do this "<%= @watch.user.name %>""
    authorize @watch
    # respond_to do |format| ...etc
    if @watch.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy
    redirect_to user_path(watch.user), status: :see_other
  end


  private

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watch).permit(:model, :user_id, :brand, :year, :price, photos: [])
  end
end
