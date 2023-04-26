class Shipment < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle
  belongs_to :customer

  enum :kind, { delivery: "delivery", dispatch: "dispatch" }
  enum :warehouse, { "high-tech": "high-tech", healthcare: "healthcare" }
  enum :internship,
       { processing: "processing", finished: "finished" },
       default: "processing"
end
