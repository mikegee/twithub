require 'spec_helper'

feature 'User Profile' do

  let(:content) { 'My Status' }
  let(:follower)  { create(:user, name: 'Follower') }
  let(:following) { create(:user, name: 'Following') }

  background do
    login
    current_user.statuses.create!(content: content)
    current_user.followers << follower
    current_user.users_followed << following
    click_link 'My Profile'
  end

  scenario 'the user should see a link to their statuses' do
    click_link '1 Status'
    expect(page).to have_content(content)
  end

  scenario 'the user should see a link to their followers' do
    click_link '1 Follower'
    expect(page).to have_content(follower.name)
  end

  scenario 'the user should see a link to the users they follow' do
    click_link 'Following 1 User'
    expect(page).to have_content(following.name)
  end

end
