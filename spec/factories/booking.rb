FactoryGirl.define do
  factory :booking do |f|
    f.user_id 1
    f.start_date '4/5/2014'
    f.end_date '4/7/2014'
  end
end
