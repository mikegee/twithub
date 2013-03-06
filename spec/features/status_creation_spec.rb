require 'spec_helper'

feature 'Status Creation' do

  let(:content) { 'My current status is: <meh>' }

  background do
    login
    fill_in 'New Status', with: content
    click_button 'Post'
  end

  scenario 'the new post should be visible on the timeline' do
    expect(page).to have_content(content)
  end

  scenario 'the author of the post should be visible within the post' do
    expect(page).to have_css('.status', text: current_user.name)
  end

end
