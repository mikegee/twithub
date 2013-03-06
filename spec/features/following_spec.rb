require 'spec_helper'

feature 'Following' do

  let!(:target) { create(:user, name: 'Target User') }
  let(:user)    { create(:user, name: 'Current User') }

  background do
    login_as user
    click_link 'People I Follow'
  end

  scenario 'the user should not see anyone there' do
    expect(page).to have_content("You aren't following any users yet.")
  end

  describe 'the user should be able to follow other users' do
    background do
      fill_in 'Name:', with: target.name
      find_by_id('follow_followee_id').set(target.id) # simulate JS
      click_button 'Follow'
    end

    scenario 'the user should see the followed user' do
      expect(page).to have_content(target.name)
    end

    scenario 'the user should be able to unfollow' do
      within "#user_#{target.id}" do
        click_link 'Following'
      end
      expect(page).to_not have_content(target.name)
    end
  end

end
