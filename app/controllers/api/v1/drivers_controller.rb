# frozen_string_literal: true

module Api
  module V1
    #
    # Controller responsible for managing driver
    #
    class DriversController < ApplicationController
      before_action :authenticate_user!
      before_action :set_driver, only: %i[show update destroy]
      load_and_authorize_resource

      def index
        @drivers = Driver.all.order(:first_name)

        render json: @drivers, each_serializer: DriverSerializer
      end

      def show
        render json: @driver, serializer: DriverSerializer
      end

      def create
        @driver = Driver.new(driver_params)
        @driver.save!

        render json: @driver, status: :created
      end

      def update
        @driver.update(driver_params)
        render json: @driver, serializer: DriverSerializer
      end

      def destroy
        @driver.destroy
      end

      private

      def set_driver
        @driver = Driver.find(params[:id])
      end

      def driver_params
        params.require(:driver).permit(
          :first_name,
          :last_name,
          :document,
          :shipping_company
        )
      end
    end
  end
end
