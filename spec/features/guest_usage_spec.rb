require 'spec_helper'

feature 'Guest Usage' do

  background do
    visit '/'
  end

  scenario 'the user should not see a timeline yet' do
    expect(page).to_not have_css('#timeline')
  end

  scenario 'the user should be able to click a login link' do
    within 'nav' do
      click_link 'Login'
    end
  end

end
