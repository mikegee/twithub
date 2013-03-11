FactoryGirl.define do

  sequence(:email)    { |n| "user#{n}@example.com"}
  sequence(:nickname) { |n| "nickname#{n}"}

  factory :user do
    nickname
    name  'John Doe'
    email
  end

end
