require 'spec_helper'

describe FavoriteMark do

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:status_id) }

  it { should validate_uniqueness_of(:status_id).scoped_to(:user_id) }

end
