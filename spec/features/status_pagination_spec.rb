require 'spec_helper'

feature 'Status Pagination' do

  background do
    login
    (1..2).each do |n|
      current_user.statuses.create!(content: "Status #{n}")
    end
    visit '/?per=1'
  end

  scenario 'there should be only one status on each page' do
    expect(page).to     have_content('Status 2')
    expect(page).to_not have_content('Status 1')
    click_link 'Next'
    expect(page).to_not have_content('Status 2')
    expect(page).to     have_content('Status 1')
  end

end
