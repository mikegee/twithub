require 'spec_helper'

feature 'Following' do

  let!(:target) { create(:user) }

  background do
    login
    click_link 'People I Follow'
  end

  scenario 'the user should not see anyone there' do
    expect(page).to have_content("You aren't following any users yet.")
  end

  scenario 'the user should be able to follow other users' do
    fill_in 'Name:', with: target.name
    click_button 'Follow'
    expect(page).to have_content(target.name)
  end

end
