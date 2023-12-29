# frozen_string_literal: true

#
# Notifications Policies
#
module Notifications
  #
  # In-App Notification policies
  #
  class InAppPolicy < ApplicationPolicy
    def update?
      record.user_id == user.id
    end
  end
end
