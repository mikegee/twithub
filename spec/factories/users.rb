FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    name  'John Doe'
    email
  end

end
