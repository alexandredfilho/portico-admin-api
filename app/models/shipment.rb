# frozen_string_literal: true

#
# This model is responsible to create new instances of Shipment
#
class Shipment < ApplicationRecord
  belongs_to :customer
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :user
  has_paper_trail

  enum kind: { receive: 'receive', dispatch: 'dispatch' }
  enum warehouse: { high_tech: 'high_tech', healthcare: 'healthcare' }
  enum status: { pending: 'pending', ready: 'ready' }

  validates :invoice_number, :kind, :warehouse, :customer_id, :driver_id, :vehicle_id, :status, presence: true

  # validate(if: ->(event) { event.pending? }) do
  #   validates :invoice_number, :kind, :warehouse, presence: true
  # end

  # validate(if: ->(model) { model.ready? }) do
  #   validates :invoice_number,
  #             :kind,
  #             :warehouse,
  #             :cargo_checker,
  #             :volume_quantity,
  #             :departure_time,
  #             :kind, presence: true
  # end

  before_update(
    if: ->(model) { model.ready? }
  ) { |model| model.departure_time = DateTime.now.strftime('%H:%M:%S') }

  after_update_commit(
    if: ->(model) { model.dispatch? && model.ready? }
  ) { |model| DeliveriesMailer.delivery_completed(model).deliver_now }
end

# == Schema Information
#
# Table name: shipments
#
#  id              :bigint           not null, primary key
#  cargo_checker   :string           not null
#  departure_time  :string
#  dock            :string           not null
#  invoice_number  :string           not null
#  kind            :string
#  status          :string
#  volume_quantity :integer          not null
#  warehouse       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :bigint           not null
#  driver_id       :bigint           not null
#  user_id         :bigint           not null
#  vehicle_id      :bigint           not null
#
# Indexes
#
#  index_shipments_on_customer_id  (customer_id)
#  index_shipments_on_driver_id    (driver_id)
#  index_shipments_on_user_id      (user_id)
#  index_shipments_on_vehicle_id   (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (driver_id => drivers.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (vehicle_id => vehicles.id)
#
