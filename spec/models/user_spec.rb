require 'spec_helper'

describe User do

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  describe '#to_s' do
    let(:user) { build(:user) }
    specify { expect(user.to_s).to eq(user.name) }
  end

end
