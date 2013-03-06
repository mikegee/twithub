require 'spec_helper'

describe User do

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  describe '#to_s' do
    let(:user) { build(:user) }
    specify { expect(user.to_s).to eq(user.name) }
  end

  describe '#timeline' do
    let(:current_user)  { create(:user, name: 'Me') }
    let(:following)     { create(:user, name: 'Following') }
    let(:not_following) { create(:user, name: 'Not Following') }

    before do
      current_user.users_followed << following
      [current_user, following, not_following].each do |user|
        user.statuses.create!(content: "My name is #{user.name}")
      end
      @timeline_content = current_user.timeline.map(&:content)
    end

    it 'should contain statuses from self' do
      expect(@timeline_content).to include('My name is Me')
    end

    it 'should contain statuses from followed users' do
      expect(@timeline_content).to include('My name is Following')
    end

    it 'should not contain statuses from unfollowed users' do
      expect(@timeline_content).to_not include('My name is Not Following')
    end
  end
end
