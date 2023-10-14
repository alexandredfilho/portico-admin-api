# frozen_string_literal: true

#
# This model is responsible to create new instances of Customers
#
class Customer < ApplicationRecord
  has_many :shipments
  validates :title, presence: true

  enum :status, { active: 'active', inactive: 'inactive' }
end

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  status     :string           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
