FactoryGirl.define do
  factory :timeline do
    sequence(:title) { |n| "Product no. #{n}" }
    sequence(:description) { |n| "We'll deploy before team no. #{n}!" }
  end
end
