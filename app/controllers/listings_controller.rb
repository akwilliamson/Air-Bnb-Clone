class ListingsController < ApplicationController

  def index
    respond_to do |format|
      format.html { @listings = Listing.all }
      format.js {@listings = Listing.basic_search(params[:search])}
    end
  end

  def show

    @date = params[:month] ? Date.parse(params[:month]) : Date.today

    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @bookings = @listing.bookings
  end

  def destroy
    Listing.find(params[:id]).destroy
    redirect_to root_path
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      current_user.listings << @listing
      redirect_to user_path(current_user)
    else
      flash[:notice] = 'HAHA Learn how to fill in a form.'
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

private
  def listing_params
    params.require(:listing).permit(:address, :description, :photo, :jacuzzi, :dominatrix_dungeon, :meat_hooks, :torture_dungeon, :pit_of_despair, :smelly_dog)
  end
end
