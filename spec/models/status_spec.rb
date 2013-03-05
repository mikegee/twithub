require 'spec_helper'

describe Status do

  it { should validate_presence_of(:author_id) }
  it { should validate_numericality_of(:author_id) }

  it { should validate_presence_of(:content) }
  it { should ensure_length_of(:content).is_at_most(200) }

end
