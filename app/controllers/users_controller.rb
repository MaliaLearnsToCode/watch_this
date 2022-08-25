class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_user, only: %i[show edit update destroy]

  def show
    authorize @user
    @watches = @user.watches
  end
    # list of watches to sell
    # list of watches that are currently rented
    # @watches = Watch.all(current_user)

  private

  def set_user
    @user = User.find(params[:id])
  end

    # def watch_params
    #   params.require(:watch).permit()
    # end

end
