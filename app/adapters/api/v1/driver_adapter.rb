module Api
  module V1
    class DriverAdapter
      def initialize(driver)
        @driver = driver
      end

      def as_json(*_args)
        {
          id: @driver.id,
          full_name: @driver.full_name,
          first_name: @driver.first_name,
          last_name: @driver.last_name,
          document: @driver.document,
          shipping_company: @driver.shipping_company,
          created_at: @driver.created_at,
          updated_at: @driver.updated_at,
        }
      end
    end
  end
end
