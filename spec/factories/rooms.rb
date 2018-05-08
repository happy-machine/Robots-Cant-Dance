FactoryBot.define do
  factory :room do
    name "Default"
    association :creator, factory: :user
  end
end
