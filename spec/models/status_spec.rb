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

  describe 'direct messaging restrictions' do
    let(:alice) { create(:user) }
    let(:bob)   { create(:user) }
    before do
      bob.users_followed << alice
    end

    it "lets alice send to bob" do
      status = build(:status)
      status.author = alice
      status.recipient_id = bob.id
      status.should be_valid
    end

    it "does not let bob send to alice" do
      status = build(:status)
      status.author = bob
      status.recipient_id = alice.id
      status.should_not be_valid
      status.errors[:author].should_not be_empty
    end
  end
end
