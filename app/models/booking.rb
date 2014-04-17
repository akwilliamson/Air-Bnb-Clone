class Booking < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validate :free_dates

  def date_range
    (self.start_date..self.end_date).to_a
  end

  def booking_months
    months =[]
    (self.start_date..self.end_date).to_a.each do |d|
      months << d.month
    end
  months.uniq
  end

  def free_dates
    self.listing.bookings.each do |b|
      b.date_range.each do |date|
        if self.date_range.include?(date)
          errors[:base] << "Dates Taken"
        end
      end
    end
  end
end
