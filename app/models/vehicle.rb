# frozen_string_literal: true

#
# This model is responsible to create new instances of Vehicles
#
class Vehicle < ApplicationRecord
  has_many :shipments
  has_many :drivers, through: :shipments

  enum :bodywork,
       { motorcycle: 'motorcycle', car: 'car', van: 'van', truck: 'truck' }
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
