# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ShipmentsControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_shipments_index_url
        assert_response :success
      end
    end
  end
end
