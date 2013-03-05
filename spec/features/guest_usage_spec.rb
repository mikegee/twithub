require 'spec_helper'

feature 'Guest Usage' do
  background do
    visit '/'
  end

  scenario 'the user should be able to click a login link' do
    click_link 'Login'
  end
end
