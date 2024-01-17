FactoryBot.define do
  factory :notification, class: 'Notifications::Notification' do
    user { create(:user) }
    type { "Notifications::InApp" }
    message { "Hey! New message!" }
  end
end

# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  action     :string
#  icon       :string
#  message    :string
#  priority   :string
#  read       :boolean
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_notifications_on_user_id_and_read  (user_id,read)
#
