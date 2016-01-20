FactoryGirl.define do
  factory :timeline do
    sequence(:title) { |n| "Product no. #{n}" }
    sequence(:description) { |n| "We'll deploy before team no. #{n}!" }

    personal false
    creator_id 1
  end
end
