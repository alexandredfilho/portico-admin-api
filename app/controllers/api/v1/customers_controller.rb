module Api
  module V1
    class CustomersController < ApplicationController
      before_action :set_customer, only: %i[show update destroy]

      def index
        @customers = Customer.select(:id, :description, :status)

        render json: @customers
      end

      def show
        render json: ::Api::V1::CustomerAdapter.new(@customer).as_json
      end

      def create
        @customer = Customer.new(customer_params)
        @customer.save!

        render json: @customer, status: :created
      end

      def update
        @customer.update(customer_params)
        render json: @customer
      end

      def destroy
        @customer.destroy
      end

      private

      def set_customer
        @customer = Customer.find(params[:id])
      end

      def customer_params
        params.require(:customer).permit(:description, :status)
      end
    end
  end
end
