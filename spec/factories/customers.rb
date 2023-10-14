FactoryBot.define do
  factory :customer do
    title { 'Company Name' }
    status {}
  end
end

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  status     :enum             default("active"), not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
