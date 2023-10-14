require 'test_helper'

class Api::V1::VehiclesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_vehicles_index_url
    assert_response :success
  end
end
