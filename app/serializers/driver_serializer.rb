# frozen_string_literal: true

#
# This serializer is used to retrieve the driver attributes
#
class DriverSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :document, :shipping_company, :created_at, :updated_at
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
