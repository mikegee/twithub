require 'spec_helper'

feature 'Logging into the app (in development mode)' do

  let(:user) { build(:user) }

  background do
    OmniAuth.config.test_mode = false
    visit '/'
    click_link 'Login'
    fill_in 'Name:',  with: user.name
    fill_in 'Email:', with: user.email
    click_button 'Sign In'
  end

  scenario 'the user should see their own name in the navbar' do
    expect(page).to have_content(user.name)
  end

  scenario 'the user should be able to logout' do
    click_link 'Logout'
    expect(page).to_not have_content(user.name)
  end

end
