FactoryBot.define do
  factory :choice do
      content { "Sample content" }
      association :poll
  end
end