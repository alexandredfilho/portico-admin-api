class Vehicle < ApplicationRecord
  has_many :shipments
  has_many :drivers, through: :shipments

  enum :bodywork,
       { motorcycle: "motorcycle", car: "car", van: "van", truck: "truck" }
end
