# frozen_string_literal: true

require 'test_helper'

class CompletedShipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: completed_shipments
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shipment_id :integer          not null
#  user_id     :integer          not null
#
