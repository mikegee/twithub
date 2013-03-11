require 'spec_helper'

feature 'Mentions Page' do

  let(:mentioner)              { create(:user, name: 'Mentioner') }
  let(:user)                   { create(:user, name: 'Current User') }
  let(:mentioning_content)     { "A status mentioning: @#{user.nickname}" }
  let(:non_mentioning_content) { "A status not mentioning: #{user.nickname}" }
  let(:mentioning_status)      { build(:status, content: mentioning_content) }
  let(:non_mentioning_status)  { build(:status, content: non_mentioning_content) }

  background do
    login_as user
    mentioner.statuses << mentioning_status
    mentioner.statuses << non_mentioning_status
    click_link 'Mentions'
  end

  scenario 'the user should see the status mentioning them' do
    expect(page).to have_content(mentioning_content)
  end

  scenario 'the user should not see the status not mentioning them' do
    expect(page).to_not have_content(non_mentioning_content)
  end

end
