# frozen_string_literal: true

#
# Notifications Module
#
module Notifications
  TYPES = %i[in_app].freeze

  def self.table_name_prefix
    'notifications_'
  end

  #
  # Public Notifications API
  #
  module Api
    module_function

    def notify_async(user_id:, options: {})
      TYPES.each do |type|
        ::Notifications::CreateNotificationJob.perform_later(
          notification_class(type),
          user_id:,
          message: options[:message],
          action: options[:action],
          icon: options[:icon],
          priority: options[:priority]
        )
      end
    end

    def notification_class(type)
      case type&.to_sym
      when :in_app
        ::Notifications::InApp
      else
        raise "Unknown notification type: #{type}"
      end
    end

    def notification_type(class_name)
      case class_name.to_s
      when /Notifications::InApp/
        :in_app
      else
        raise "Unknown notification class: #{class_name}"
      end
    end
  end
end
