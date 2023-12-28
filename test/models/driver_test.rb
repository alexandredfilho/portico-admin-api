# frozen_string_literal: true

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: drivers
#
#  id               :bigint           not null, primary key
#  document         :string           not null
#  first_name       :string           not null
#  full_name        :string
#  last_name        :string
#  shipping_company :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
