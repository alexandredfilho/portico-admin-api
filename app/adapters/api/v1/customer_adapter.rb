module Api
  module V1
    class CustomerAdapter
      def initialize(customer)
        @customer = customer
      end

      def as_json(*_args)
        {
          id: @customer.id,
          title: @customer.title,
          status: @customer.status,
          created_at: @customer.created_at,
          updated_at: @customer.updated_at,
        }
      end
    end
  end
end
