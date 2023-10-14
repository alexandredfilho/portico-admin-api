#
# A shipment is a relationship between customer, driver and an invoice
#
class Shipment < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :customer
  has_paper_trail

  enum kind: { receive: 'receive', dispatch: 'dispatch' }
  enum warehouse: { high_tech: 'high_tech', healthcare: 'healthcare' }
  enum status: { pending: 'pending', ready: 'ready' }

  validates :cargo_checker, :kind, :warehouse, :status, presence: true

  validate(if: ->(model) { model.pending? }) do
    validates :invoice_number, :kind, :warehouse, presence: true
  end

  validate(if: ->(model) { model.ready? }) do
    validates :invoice_number,
              :kind,
              :warehouse,
              :cargo_checker,
              :kind, presence: true
  end

  after_update_commit(
    if: ->(model) { model.dispatch? && model.ready? }
  ) { |model| DeliveriesMailer.delivery_completed(model).deliver_now }
end

# == Schema Information
#
# Table name: shipments
#
#  id             :bigint           not null, primary key
#  cargo_checker  :string           not null
#  dock           :string           not null
#  invoice_number :string           not null
#  kind           :text             not null
#  status         :text             not null
#  warehouse      :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :bigint           not null
#  driver_id      :bigint           not null
#  vehicle_id     :bigint           not null
#
# Indexes
#
#  index_shipments_on_customer_id  (customer_id)
#  index_shipments_on_driver_id    (driver_id)
#  index_shipments_on_vehicle_id   (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (driver_id => drivers.id)
#  fk_rails_...  (vehicle_id => vehicles.id)
#
