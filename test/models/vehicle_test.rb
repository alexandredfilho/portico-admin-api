require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: vehicles
#
#  id            :bigint           not null, primary key
#  bodywork      :enum             not null
#  license_plate :string
#  manufacturer  :string
#  sample        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
