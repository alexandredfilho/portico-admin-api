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
FactoryBot.define do
  factory :shipment do
    association :customer, factory: :customer
    association :driver, factory: :driver
    association :vehicle, factory: :vehicle

    cargo_checker { "John Doe" }
    dock { "2" }
    invoice_number { "12345" }
    kind { "delivery" }
    warehouse { "high-tech" }
  end
end
