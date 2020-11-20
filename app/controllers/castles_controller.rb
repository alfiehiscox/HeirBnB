class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :homepage]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @castles = Castle.where(sql_query, query: "%#{params[:query]}%")
    else
      @castles = Castle.all
    end
  end

  def homepage
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
    @marker = [{ lat: @castle.latitude, lng: @castle.longitude }]
  end

  private

  def castles_params
    params.require(:castle).permit(:name, :address, :price_per_night, :photo)
  end
end
