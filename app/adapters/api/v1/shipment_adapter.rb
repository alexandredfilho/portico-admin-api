module Api
  module V1
    class ShipmentAdapter
      def initialize(shipment)
        @shipment = shipment
      end

      def as_json(*_args)
        {
          id: @shipment.id,
          customer: build_customer(@shipment.customer_id),
          invoice_number: @shipment.invoice_number,
          dock: @shipment.dock,
          kind: @shipment.kind,
          warehouse: @shipment.warehouse,
          driver: build_driver(@shipment.driver_id),
          vehicle: build_vehicle(@shipment.vehicle_id),
          internship: @shipment.internship,
          created_at: @shipment.created_at,
          updated_at: @shipment.updated_at,
        }
      end

      private

      def build_customer(customer_id)
        Customer.select(:id, :description, :status).where(id: customer_id)
      end

      def build_driver(driver_id)
        Driver.select(:id, :full_name, :shipping_company).where(id: driver_id)
      end

      def build_vehicle(vehicle_id)
        Vehicle.select(
          :id,
          :manufacturer,
          :sample,
          :license_plate,
          :bodywork,
        ).where(id: vehicle_id)
      end
    end
  end
end
