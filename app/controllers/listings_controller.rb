class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show update destroy]

  def index
    @listings = Listing.all
    render json: @listings
  end

  def show
  end

  def create
    @listing = Listing.new(strong_params)
  end

  def update
    @listing.update(strong_params)
  end

  def destroy
    @listing.destroy
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def strong_params
    params.require(:listing).permit(:num_rooms)
  end
end
