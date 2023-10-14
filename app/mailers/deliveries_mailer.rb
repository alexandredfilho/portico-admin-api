class DeliveriesMailer < ApplicationMailer
  #
  # This method is responsible for send an email
  #
  # @param [shipment] shipment
  #
  # @return [void]
  #
  def delivery_completed(shipment)
    @shipment = shipment

    mail to: 'to@example.org'
  end
end
