FactoryBot.define do
  factory :notification, class: 'Notifications::Notification' do
    user { create(:user) }
    type { "Notifications::InApp" }
    message { "Hey! New message!" }
  end
end
