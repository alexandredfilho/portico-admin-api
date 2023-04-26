module Api
  module V1
    class VehiclesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_vehicle, only: %i[show update destroy]

      def index
        @vehicles =
          Vehicle.select(
            :id,
            :manufacturer,
            :sample,
            :license_plate,
            :bodywork,
          ).order(:manufacturer)

        render json: @vehicles
      end

      def show
        render json: ::Api::V1::VehicleAdapter.new(@vehicle).as_json
      end

      def create
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.save!

        render json: @vehicle, status: :created
      end

      def update
        @vehicle.update(vehicle_params)
        render json: @vehicle
      end

      def destroy
        @vehicle.destroy
      end

      private

      def set_vehicle
        @vehicle = Vehicle.find(params[:id])
      end

      def vehicle_params
        params.require(:vehicle).permit(
          :manufacturer,
          :sample,
          :bodywork,
          :license_plate,
        )
      end
    end
  end
end
