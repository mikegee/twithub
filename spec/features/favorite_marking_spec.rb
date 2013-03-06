require 'spec_helper'

feature 'Marking Favorite Statuses' do

  let(:content) { 'Best Status Evar!' }

  background do
    login
    @status = current_user.statuses.create!(content: content)
    visit '/'
    within "#status_#{@status.id}" do
      click_link 'Mark as Favorite'
    end
    click_link 'Favorites'
  end

  scenario 'the user should see the marked status in their favorites list' do
    expect(page).to have_content(content)
  end

  scenario 'the user should be able to unfavorite a status' do
    within "#status_#{@status.id}" do
      click_link 'Unmark as Favorite'
    end
    expect(page).to_not have_content(content)
  end

end
