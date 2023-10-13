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
FactoryBot.define do
  factory :vehicle do
    bodywork { "truck" }
    license_plate { "ABC1234" }
    manufacturer { "Volkswagen" }
    sample { "Constelation" }
  end
end
