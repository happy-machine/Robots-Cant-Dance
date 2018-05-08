FactoryBot.define do
    factory :user do
      name  "John Smith"
      email "john@smith.com"
      password "pass123"
      
      factory :user_with_rooms do
        after(:create) do |user, evaluator|
          create_list(:room, 1)
        end
      end
      
    end
  end