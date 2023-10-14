FactoryBot.define do
  factory :driver do
    document { '123456789' }
    first_name { 'Han' }
    last_name { 'Solo' }
    shipping_company { 'XPTO Log' }
  end
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
