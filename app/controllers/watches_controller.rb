class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]
  before_action :set_watch, only: %i[show edit update destroy]

  def index
    @watches = Watch.all
    @watches = policy_scope(Watch)
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
    params.require(:watch).permit(:model, :user_id, :brand, :year, :price, :photo)
  end
end
