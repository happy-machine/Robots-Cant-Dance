FactoryBot.define do
    factory :room do
      name "Default"
      association factory: :messages, factory: :user
    end
  end