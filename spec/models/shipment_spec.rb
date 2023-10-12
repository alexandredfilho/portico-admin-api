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
require "rails_helper"

RSpec.describe Shipment, type: :model do
  let(:driver) do
    Driver.create(
      document: "123456789",
      first_name: "John",
      last_name: "Doe",
      shipping_company: "XPTO",
    )
  end
  let(:vehicle) do
    Vehicle.create(
      bodywork: "truck",
      license_plate: "ABC0000",
      manufacturer: "Volkswagen",
      sample: "Constelation",
    )
  end
  let(:customer) { Customer.create(title: "Customer") }
  let(:shipment) do
    Shipment.new(
      cargo_checker: "Han Solo",
      dock: "2",
      kind: "delivery",
      invoice_number: "12345",
      warehouse: "healthcare",
      customer_id: customer.id,
      driver_id: driver.id,
      vehicle_id: vehicle.id,
    )
  end

  describe ".creating a shipment" do
    context "when all fields are valid" do
      it "should create a new shipment" do
        expect(shipment).to be_valid
      end
    end

    context "when the cargo checker is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: nil,
            dock: "2",
            kind: "delivery",
            invoice_number: "12345",
            warehouse: "healthcare",
            customer_id: customer.id,
            driver_id: driver.id,
            vehicle_id: vehicle.id,
          )

        expect(shipment).to_not be_valid
      end
    end

    context "when the kind is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: nil,
            dock: "2",
            kind: nil,
            invoice_number: "12345",
            warehouse: "healthcare",
            customer_id: customer.id,
            driver_id: driver.id,
            vehicle_id: vehicle.id,
          )

        expect(shipment).to_not be_valid
      end
    end

    context "when the status is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: nil,
            dock: "2",
            kind: "delivery",
            status: nil,
            invoice_number: "12345",
            warehouse: "healthcare",
            customer_id: customer.id,
            driver_id: driver.id,
            vehicle_id: vehicle.id,
          )

        expect(shipment).to_not be_valid
      end
    end

    context "when the warehouse is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: nil,
            dock: "2",
            kind: "delivery",
            invoice_number: "12345",
            warehouse: nil,
            customer_id: customer.id,
            driver_id: driver.id,
            vehicle_id: vehicle.id,
          )

        expect(shipment).to_not be_valid
      end
    end

    context "when the customer is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: "Han Solo",
            dock: "2",
            kind: "delivery",
            invoice_number: "12345",
            warehouse: "healthcare",
            customer_id: nil,
            driver_id: driver.id,
            vehicle_id: vehicle.id,
          )

        expect(shipment).to_not be_valid
      end
    end

    context "when the driver is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: "Han Solo",
            dock: "2",
            kind: "delivery",
            invoice_number: "12345",
            warehouse: "healthcare",
            customer_id: customer.id,
            driver_id: nil,
            vehicle_id: vehicle.id,
          )

        expect(shipment).to_not be_valid
      end
    end

    context "when the vehicle is nil" do
      it "should return an error" do
        shipment =
          described_class.new(
            cargo_checker: "Han Solo",
            dock: "2",
            kind: "delivery",
            invoice_number: "12345",
            warehouse: "healthcare",
            customer_id: customer.id,
            driver_id: driver.id,
            vehicle_id: nil,
          )

        expect(shipment).to_not be_valid
      end
    end

    describe ".associations" do
      it "belongs to a driver" do
        association = described_class.reflect_on_association(:driver)
        expect { should belongs_to(:driver) }
      end

      it "belongs to a vehicle" do
        association = described_class.reflect_on_association(:vehicle)
        expect { should belongs_to(:vehicle) }
      end

      it "belongs to a customer" do
        association = described_class.reflect_on_association(:customer)
        expect { should belongs_to(:customer) }
      end
    end
  end
end
