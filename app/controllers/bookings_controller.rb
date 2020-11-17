class BookingsController < ApplicationController
  def new
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.castle = Castle.find(params[:castle_id])
    if @booking.save
      redirect_to castle_booking_path(params[:castle_id], @booking.id)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
