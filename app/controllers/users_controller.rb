class UsersController < ApplicationController
  def index
  end




  def show

    @user = User.find(params[:id])
    d = Date.new(1900)
    @past_bookings = @user.bookings.where(end_date: (d..Date.today) )
  end

end
