module Api
  module V1
    class ShipmentsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_shipment, only: %i[show update destroy]

      def index
        @shipments =
          Shipment
          .select(
            :id,
            :customer_id,
            :invoice_number,
            :cargo_checker,
            :dock,
            :kind,
            :warehouse,
            :driver_id,
            :vehicle_id,
            :internship
          )
          .includes(:driver, :vehicle, :customer)
          .order(:created_at)

        render json: @shipments
      end

      def show
        render json: ::Api::V1::ShipmentAdapter.new(@shipment).as_json
      end

      def create
        @shipment = Shipment.new(shipment_params)
        @shipment.save!

        render json: ::Api::V1::ShipmentAdapter.new(@shipment).as_json,
               status: :created
      end

      def update
        @shipment.update(shipment_params)
        render json: @shipment
      end

      def destroy
        @shipment.destroy
      end

      private

      def set_shipment
        @shipment = Shipment.find(params[:id])
      end

      def shipment_params
        params.require(:shipment).permit(
          :customer_id,
          :invoice_number,
          :cargo_checker,
          :dock,
          :kind,
          :warehouse,
          :driver_id,
          :vehicle_id,
          :internship
        )
      end
    end
  end
end
