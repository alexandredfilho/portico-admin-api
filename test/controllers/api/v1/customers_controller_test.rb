# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CustomersControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_customers_index_url
        assert_response :success
      end
    end
  end
end
