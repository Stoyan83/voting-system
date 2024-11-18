require 'rails_helper'

RSpec.describe Choice, type: :model do
  it { should belong_to(:poll) }
  it { should have_many(:users).through(:votes) }

  it { should validate_presence_of(:content) }
  it { should validate_length_of(:content).is_at_most(255) }
end
