# frozen_string_literal: true

FactoryBot.define do
  factory :shipment do
    association :customer, factory: :customer
    association :driver, factory: :driver
    association :vehicle, factory: :vehicle

    invoice_number { '12345' }
    kind { 'receive' }
    warehouse { 'high_tech' }
    dock { '2' }
    cargo_checker { 'John Doe' }
    status { 'pending' }
  end
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
