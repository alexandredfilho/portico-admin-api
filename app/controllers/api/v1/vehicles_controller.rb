# frozen_string_literal: true

module Api
  module V1
    #
    # Controller responsible for managing driver
    #
    class VehiclesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_vehicle, only: %i[show update destroy]

      def index
        @vehicles = Vehicle.all.order(:manufacturer)

        render json: @vehicles, each_serializer: VehicleSerializer
      end

      def show
        render json: @vehicle, serializer: VehicleSerializer
      end

      def create
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.save!

        render json: @vehicle, status: :created
      end

      def update
        @vehicle.update(vehicle_params)
        render json: @vehicle, serializer: VehicleSerializer
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
          :license_plate
        )
      end
    end
  end
end
