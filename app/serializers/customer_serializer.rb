# frozen_string_literal: true

#
# This serializer is used to retrieve the customer attributes
#
class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :created_at, :updated_at
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
