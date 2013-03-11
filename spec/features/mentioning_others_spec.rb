require 'spec_helper'

feature 'Mentioning Others' do

  let(:target)  { create(:user, name: 'Target User') }
  let(:user)    { create(:user, name: 'Current User') }
  let(:content) { "A status mentioning: @#{target.username}" }
  let(:status)  { build(:status, content: content) }

  background do
    login_as user
    user.statuses << status
    visit '/'
  end

  scenario 'the user should be able to click the target username' do
    within "#status_#{status.id}" do
      click_link "@#{target.username}"
    end
  end

end
