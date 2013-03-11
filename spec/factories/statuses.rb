FactoryGirl.define do

  factory :status do
    author { FactoryGirl.build(:user) }
  end

end
