# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class VehiclesControllerTest < ActionDispatch::IntegrationTest
      test 'should get index' do
        get api_v1_vehicles_index_url
        assert_response :success
      end
    end
  end
end
