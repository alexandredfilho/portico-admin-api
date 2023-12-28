# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shipment, type: :model do
  let(:shipment) { build_stubbed(:shipment) }

  describe '.creating a shipment' do
    context 'when all fields are valid' do
      it 'should create a new shipment' do
        expect(shipment).to be_valid
      end
    end

    context 'when the invoice number is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, invoice_number: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:invoice_number][0]).to eq("can't be blank")
      end
    end

    context 'when the kind is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, kind: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:kind][0]).to eq("can't be blank")
      end
    end

    context 'when the warehouse is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, warehouse: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:warehouse][0]).to eq("can't be blank")
      end
    end

    context 'when the customer is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, customer_id: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:customer_id][0]).to eq(
          "can't be blank"
        )
      end
    end

    context 'when the driver is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, driver_id: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:driver_id][0]).to eq("can't be blank")
      end
    end

    context 'when the vehicle is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, vehicle_id: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:vehicle_id][0]).to eq("can't be blank")
      end
    end

    context 'when the status is nil' do
      it 'should return an error' do
        shipment = build_stubbed(:shipment, status: nil)

        expect(shipment).to_not be_valid
        expect(shipment.errors.messages[:status][0]).to eq("can't be blank")
      end
    end

    context 'when the shipment is updated and the status is ready' do
      it 'should fill in the departure time automatically' do
        shipment = create(:shipment)
        shipment.update!(status: 'ready')

        expect(shipment).to be_valid
        expect(shipment.departure_time).to eq(shipment.updated_at)
      end
    end

    describe '.associations' do
      it 'belongs to a customer' do
        described_class.reflect_on_association(:customer)
        expect { should belongs_to(:customer) }
      end

      it 'belongs to a driver' do
        described_class.reflect_on_association(:driver)
        expect { should belongs_to(:driver) }
      end

      it 'belongs to a vehicle' do
        described_class.reflect_on_association(:vehicle)
        expect { should belongs_to(:vehicle) }
      end

      it 'belongs to a user' do
        described_class.reflect_on_association(:user)
        expect { should belongs_to(:user) }
      end
    end
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
