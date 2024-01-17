require 'rails_helper'

RSpec.describe Notifications::Notification, :model do
  it { is_expected.to belong_to(:user) }
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
