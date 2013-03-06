require 'spec_helper'

feature 'Marking Favorite Statuses' do

  let(:content) { 'Best Status Evar!' }

  background do
    login
    status = current_user.statuses.create!(content: content)
    visit '/'
    within "#status_#{status.id}" do
      click_link 'Mark as Favorite'
    end
  end

  scenario 'the user should see the marked status in their favorites list' do
    click_link 'Favorites'
    expect(page).to have_content(content)
  end

end
