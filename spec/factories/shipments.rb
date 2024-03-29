# frozen_string_literal: true

FactoryBot.define do
  factory :shipment do
    association :customer, factory: :customer
    association :driver, factory: :driver
    association :vehicle, factory: :vehicle
    association :user, factory: :user

    invoice_number { '12345' }
    kind { 'receive' }
    warehouse { 'high_tech' }
    dock { '2' }
    cargo_checker { 'John Doe' }
    volume_quantity { 2 }
    status { 'pending' }
  end
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
