class Customer < ApplicationRecord
  has_many :shipments

  enum :status, { active: "active", inactive: "inactive" }, default: "active"
end
