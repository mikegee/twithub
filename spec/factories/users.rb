FactoryGirl.define do

  sequence(:email)    { |n| "user#{n}@example.com"}
  sequence(:username) { |n| "username#{n}"}

  factory :user do
    username
    name  'John Doe'
    email
  end

end
