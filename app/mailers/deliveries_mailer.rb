# frozen_string_literal: true

#
# This class is used to send email notifications
#
class DeliveriesMailer < ApplicationMailer
  #
  # This method is responsible for send an email when a delivery is successful completed.
  #
  # @param [shipment] shipment
  #
  # @return [void]
  #
  def delivery_completed(shipment)
    @shipment = shipment

    mail to: 'to@example.org', subject: 'New shipment for shipping is ready'
  end
end
