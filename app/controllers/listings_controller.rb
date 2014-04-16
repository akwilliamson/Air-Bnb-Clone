class ListingsController < ApplicationController

  def index
    @listings = Listing.find(:all, :order => 'created_at').reverse
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
    params.require(:listing).permit(:address, :description, :photo)
  end
end
