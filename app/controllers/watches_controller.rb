class WatchesController < ApplicationController
skip_before_action :authenticate_user!, only: :home
  def index
    @watches = Watch.all
    @watches = policy_scope(Watch)
  end
end
