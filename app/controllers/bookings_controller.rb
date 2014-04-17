class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.update(user_id: current_user.id)
      flash[:notice] = "Booked! Enjoy your stay from #{@booking.start_date} to #{@booking.end_date}"
      redirect_to :back
    else
      redirect_to :back
      flash[:notice] = @booking.errors.messages

    end
  end

private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :listing_id)
  end
end
