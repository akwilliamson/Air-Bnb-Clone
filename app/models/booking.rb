class Booking < ActiveRecord::Base
  belongs_to :listing
  belongs_to :user

  validates :start_date, :presence => true
  validates :end_date, :presence => true

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
end
