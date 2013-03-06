require 'spec_helper'

describe Follow do

  it { should validate_presence_of(:follower_id) }
  it { should validate_presence_of(:followee_id) }

  it { should validate_uniqueness_of(:follower_id).scoped_to(:followee_id) }

end
