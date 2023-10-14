# frozen_string_literal: true

#
# This serializer is used to retrieve the vehicle attributes
#
class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :manufacturer, :sample, :license_plate, :bodywork, :created_at, :updated_at, :updated_at
end

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
