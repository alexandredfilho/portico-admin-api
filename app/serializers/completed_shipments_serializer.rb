# frozen_string_literal: true

#
# This serializer is responsible to retrieve the shipment attributes
#
class CompletedShipmentsSerializer < ActiveModel::Serializer
  attributes :id, :user, :shipment
end
