FactoryGirl.define do
  factory :post do
    association :user
    sequence(:title) { |n| "How to smoke salmon #{n}" }
    body "https://www.youtube.com/watch?v=SGmIMyipu3g"
  end
end
