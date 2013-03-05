require 'spec_helper'

feature 'Guest Usage' do
  background do
    visit '/'
  end

  scenario 'the user should be able to click a sign in link' do
    click_link 'Sign In'
  end
end
