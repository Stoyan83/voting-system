require 'rails_helper'

RSpec.describe Poll, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(255) }
  it { should validate_length_of(:description).is_at_most(65_535) }

  it { should have_many(:choices) }
end
