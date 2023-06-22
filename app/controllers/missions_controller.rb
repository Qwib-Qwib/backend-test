class MissionsController < ApplicationController
  def index
    # @missions = Mission.where(listing: params[:listing_id])
    @missions = Mission.all
    render json: @missions
  end
end
