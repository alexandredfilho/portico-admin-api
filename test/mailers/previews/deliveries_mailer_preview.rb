# Preview all emails at http://localhost:3000/rails/mailers/deliveries_mailer
class DeliveriesMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/deliveries_mailer/delivery_completed
  def delivery_completed
    DeliveriesMailer.delivery_completed(Shipment.first)
  end
end
