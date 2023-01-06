class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.dinosaur = Dinosaur.find(params[:dinosaur_id])
    @booking.user = current_user
    @booking.booking_price = @booking.duration * @booking.dinosaur.price_per_day.fdiv(100)
    if @booking.save!
      redirect_to my_bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
