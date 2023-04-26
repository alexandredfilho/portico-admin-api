module Api
  module V1
    class DriversController < ApplicationController
      before_action :authenticate_user!
      before_action :set_driver, only: %i[show update destroy]

      def index
        @drivers =
          Driver.select(
            :id,
            :full_name,
            :first_name,
            :last_name,
            :document,
            :shipping_company,
          ).order(:first_name)

        render json: @drivers
      end

      def show
        render json: ::Api::V1::DriverAdapter.new(@driver).as_json
      end

      def create
        @driver = Driver.new(driver_params)
        @driver.save!

        render json: @driver, status: :created
      end

      def update
        @driver.update(driver_params)
        render json: @driver
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
          :shipping_company,
        )
      end
    end
  end
end
