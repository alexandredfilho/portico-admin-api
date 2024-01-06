# frozen_string_literal: true

module Notifications
  ACTIONS = %w[go_to_shipment].freeze
  ICONS = %w[].freeze
  PRIORITIES = %w[info warning error].freeze

  #
  # Base class for all Notifications
  #
  class Notification < ApplicationRecord
    belongs_to :user, class_name: '::User', foreign_key: 'user_id'

    scope :unread, ->(user_id) { where(user_id:, read: false) }

    validates :action,   inclusion: ACTIONS, allow_nil: true
    validates :icon,     inclusion: ICONS,   allow_nil: true
    validates :priority, inclusion: PRIORITIES, allow_nil: true
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
