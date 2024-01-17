# frozen_string_literal: true

module Notifications
  #
  # Asynchronously create a notification
  #
  class CreateNotificationJob < ApplicationJob
    queue_as :notifications

    def perform(notification_model, *args)
      notification_model.create!(args[0])

      broadcast_notification(args[0][:user_id])

      :ok
    end

    private

    def broadcast_notification(user_id)
      notifications = ::Notifications::InApp.unread(user_id)
      total = notifications.count

      ActionCable.server.broadcast(
        "notifications:#{user_id}",
        { total:, notifications: }
      )
    end
  end
end
