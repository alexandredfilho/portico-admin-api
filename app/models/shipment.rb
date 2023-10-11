# == Schema Information
#
# Table name: shipments
#
#  id             :bigint           not null, primary key
#  cargo_checker  :string           not null
#  dock           :string           not null
#  invoice_number :string           not null
#  kind           :enum             not null
#  status         :enum             not null
#  warehouse      :enum             not null
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
class Shipment < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :customer

  enum :kind, { delivery: "delivery", dispatch: "dispatch" }
  enum :warehouse, { "high-tech": "high-tech", healthcare: "healthcare" }
  enum :status,
       { processing: "processing", finished: "finished" },
       default: "processing"

  validates_presence_of :cargo_checker,
                        :kind,
                        :warehouse,
                        :status,
                        :customer_id,
                        :driver_id,
                        :vehicle_id
end
