require 'spec_helper'

describe Status do

  it { should validate_presence_of(:author) }

  it { should validate_presence_of(:content) }
  it { should ensure_length_of(:content).is_at_most(200) }

  describe '#mentioned_users' do
    let(:user)   { create(:user) }
    let(:status) { create(:status, content: "Mentioning: @#{user.nickname}" ) }

    it 'should link to the mentioned user' do
      expect(status.mentioned_users).to eq([user])
    end

    context 'two users mentioned' do
      let(:user2)  { create(:user) }
      let(:status) { create(:status, content: "Both @#{user.nickname} and @#{user2.nickname}") }

      it 'should link to both the mentioned users' do
        expect(status.mentioned_users).to include(user, user2)
        expect(status.mentioned_users.size).to eq(2)
      end
    end
  end
end
