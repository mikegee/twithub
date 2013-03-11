FactoryGirl.define do

  factory :status do
    author { FactoryGirl.build(:user) }
    content 'some status content'
  end

end
