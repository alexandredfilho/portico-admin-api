# frozen_string_literal: true

module Api
  module V1
    #
    # Controller responsible for managing completed shipments
    #
    class CompletedShipmentsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_paper_trail_whodunnit
      load_and_authorize_resource

      def index
        @completed_shipments = CompletedShipment.all.order(:created_at)

        render json: @completed_shipments, each_serializer: CompletedShipmentsSerializer
      end

      def create
        @completed_shipments = CompletedShipment.new(completed_shipment_params)
        @completed_shipments.save!

        render json: @completed_shipments, status: :created
      end

      private

      def completed_shipment_params
        params.require(:completed_shipment).permit(:user_id, :shipment_id)
      end
    end
  end
end
