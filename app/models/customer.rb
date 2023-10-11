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
class Customer < ApplicationRecord
  has_many :shipments
  validates_presence_of :description

  enum :status, { active: "active", inactive: "inactive" }, default: "active"
end
