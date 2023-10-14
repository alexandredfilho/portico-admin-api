class Customer < ApplicationRecord
  has_many :shipments
  validates :title, presence: true

  enum :status, { active: 'active', inactive: 'inactive' }, default: 'active'
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
