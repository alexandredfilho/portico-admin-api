# frozen_string_literal: true

#
#
# This class is used to store all completed shipments and who completed them
#
class CompletedShipment < ApplicationRecord
end

# == Schema Information
#
# Table name: completed_shipments
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shipment_id :integer          not null
#  user_id     :integer          not null
#
