require 'spec_helper'



describe Booking do
  describe 'free_dates' do
    it 'ensures that you dont create conflicting bookings' do
      l = FactoryGirl.create(:listing)
      b = Booking.create(listing_id: l.id, start_date: '01-01-2014', end_date: '06-01-2014', user_id: 1)
      c = Booking.create(listing_id: l.id, start_date: '02-01-2014', end_date: '02-01-2014', user_id: 1)
      c.errors[:base][0].should eq "Dates Taken"
    end
  end
end
