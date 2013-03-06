require 'spec_helper'

feature 'Followers' do

  let(:follower) { create(:user) }

  background do
    login
    click_link 'Followers'
  end

  scenario 'the user should not see anyone there' do
    expect(page).to have_content("Nobody is following you yet.")
  end

  describe 'the user should be able to follow other users' do
    background do
      current_user.followers << follower
      click_link 'Followers'
    end

    scenario 'the user should see the follower' do
      expect(page).to have_content(follower.name)
    end
  end

end
