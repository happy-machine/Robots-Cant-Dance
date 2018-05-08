FactoryBot.define do
  factory :message do
    content "This is a message"
    association :user, factory: :user, email: 'foo@bar.com'
    association :room, factory: :room
  end
end
