class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @castles = Castle.all
    @counter = rand(6)
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.new(castles_params)
    @castle.user = current_user
    if @castle.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @castle = Castle.find(params[:id])
    @booking = Booking.new
    # @castles = Castle.all

    # For map
    # @markers = @castle.geocoded.map do |castle| {
    #   lat: castle.latitude,
    #   lng: castle.longitude
    # }
    # end

    @marker = [{ lat: @castle.latitude, lng: @castle.longitude }]
  end

  private

  def castles_params
    params.require(:castle).permit(:name, :address, :price_per_night)
  end
end
