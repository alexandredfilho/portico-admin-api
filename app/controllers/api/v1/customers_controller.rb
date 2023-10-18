# frozen_string_literal: true

module Api
  module V1
    #
    # Controller responsible for managing customer
    #
    class CustomersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_customer, only: %i[show update destroy]
      load_and_authorize_resource

      def index
        @customers = Customer.all

        render json: @customers, each_serializer: CustomerSerializer
      end

      def show
        render json: @customer, serializer: CustomerSerializer
      end

      def create
        @customer = Customer.new(customer_params)
        authorize! @customer.save!

        render json: @customer, status: :created
      end

      def update
        @customer.update(customer_params)
        render json: @customer, serializer: CustomerSerializer
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
