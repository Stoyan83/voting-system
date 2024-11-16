require 'rails_helper'

RSpec.describe Choice, type: :model do
  it { should belong_to(:choosable) }
end
