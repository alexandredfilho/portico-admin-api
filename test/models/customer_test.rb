# == Schema Information
#
# Table name: customers
#
#  id          :bigint           not null, primary key
#  description :string
#  status      :enum             default("active"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
