require 'spec_helper'

feature 'Guest Usage' do

  context 'without any statuses' do
    background do
      visit '/'
    end

    scenario 'the user should be able to click a login link' do
      click_link 'Login'
    end

    scenario 'the user should see the public timeline' do
      expect(page).to have_content('Timeline')
    end
  end

  context 'a single status exists' do
    let(:content) { 'check out this cool new Twitter clone' }

    background do
      Status.stub(:all) { [mock_model(Status, content: content)] }
      visit '/'
    end

    scenario 'the guest should see that one status in the timeline' do
      expect(page).to have_content(content)
    end
  end
end
