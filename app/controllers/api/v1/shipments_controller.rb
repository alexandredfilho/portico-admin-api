# frozen_string_literal: true

module Api
  module V1
    #
    # Controller responsible for managing shipment
    #
    class ShipmentsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_shipment, only: %i[show update destroy]

      def index
        @shipments = Shipment.all.includes(:driver, :vehicle, :customer).order(:created_at)

        render json: @shipments, each_serializer: ShipmentSerializer
      end

      def show
        render json: @shipment, serializer: ShipmentSerializer
      end

      def create
        @shipment = Shipment.new(shipment_params)
        @shipment.save!

        render json: @shipment, status: :created
      end

      def update
        @shipment.update(shipment_params)
        render json: @shipment, serializer: ShipmentSerializer
      end

      def destroy
        @shipment.destroy
      end

      private

      def set_shipment
        @shipment = Shipment.find(params[:id])
      end

      def shipment_params
        params.require(:shipment).permit(:customer_id, :invoice_number, :cargo_checker, :dock, :kind, :warehouse,
                                         :driver_id, :vehicle_id, :status)
      end
    end
  end
end
