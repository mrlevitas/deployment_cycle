FactoryGirl.define do
  factory :event do
    sequence(:title) { |n| "Event no. #{n}" }
    sequence(:description) { |n| "We need no. #{n} done!" }
    sequence(:date_and_time) { |n| Time.now + n.weeks + 1.hour }
    timeline_id 1
  end
end
