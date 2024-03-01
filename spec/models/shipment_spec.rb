# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shipment, type: :model do
  subject { create(:shipment) }

  it { is_expected.to validate_presence_of(:invoice_number) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:warehouse) }
  it { is_expected.to validate_presence_of(:customer_id) }
  it { is_expected.to validate_presence_of(:driver_id) }
  it { is_expected.to validate_presence_of(:vehicle_id) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:driver) }
  it { is_expected.to belong_to(:vehicle) }
  it { is_expected.to belong_to(:user) }
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
