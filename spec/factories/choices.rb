FactoryBot.define do
  factory :choice do
      content { "Sample content" }
      association :choosable, factory: :poll 
  end
end