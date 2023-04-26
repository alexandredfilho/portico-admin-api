module Api
  module V1
    class VehicleAdapter
      def initialize(vehicle)
        @vehicle = vehicle
      end

      def as_json(*_args)
        {
          id: @vehicle.id,
          manufacturer: @vehicle.manufacturer,
          sample: @vehicle.sample,
          license_plate: @vehicle.license_plate,
          bodywork: @vehicle.bodywork,
          created_at: @vehicle.created_at,
          updated_at: @vehicle.updated_at,
        }
      end
    end
  end
end
