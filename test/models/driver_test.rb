# == Schema Information
#
# Table name: drivers
#
#  id               :bigint           not null, primary key
#  document         :string
#  first_name       :string
#  full_name        :string
#  last_name        :string
#  shipping_company :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
