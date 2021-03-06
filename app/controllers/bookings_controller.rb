class BookingsController < ApplicationController

  # This is bookings filtered to the current user
  def index
    @bookings = Booking.where(user_id: current_user)
    @castles = Castle.where(user_id: current_user)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.castle = Castle.find(params[:castle_id])
    if @booking.save
      # redirect_to castle_booking_path(params[:castle_id], @booking.id)
      redirect_to bookings_path
    else
      @castle = Castle.find(params[:castle_id])
      render :template => "castles/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def confirm
    booking = Booking.find(params[:id])
    booking.status = "confirmed"
    booking.save
    redirect_to bookings_path
  end

  def decline
    booking = Booking.find(params[:id])
    booking.status = "declined"
    booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
