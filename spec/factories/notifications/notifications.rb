FactoryBot.define do
  factory :notification, class: 'Notifications::Notification' do
    user { create(:accounts_user) }
    type { "Notifications::InApp" }
    message { "Hey! New message!" }
  end
end
